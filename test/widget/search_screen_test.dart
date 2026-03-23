import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:github_search_app/features/search/providers/search_providers.dart';
import 'package:github_search_app/features/search/ui/search_screen.dart';

import '../helpers/test_helpers.dart';

void main() {
  late MockGitHubRepository mockRepo;

  setUpAll(() {
    // Chặn mọi NetworkImage request → không còn lỗi HTTP 400
    setupTestEnvironment();
  });

  setUp(() {
    mockRepo = MockGitHubRepository();
  });

  group('SearchScreen', () {
    // ---- Initial state ----
    testWidgets('shows initial view with search hint', (tester) async {
      await pumpApp(
        tester,
        child: const SearchScreen(),
        overrides: [
          gitHubRepositoryProvider.overrideWithValue(mockRepo),
        ],
      );

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('search_field')), findsOneWidget);
      expect(find.byKey(const Key('initial_view')), findsOneWidget);
      expect(find.text('Search for GitHub users'), findsOneWidget);
    });

    // ---- Search results ----
    testWidgets('shows search results when typing', (tester) async {
      when(() => mockRepo.searchUsers(any()))
          .thenAnswer((_) async => TestData.searchResult());

      await pumpApp(
        tester,
        child: const SearchScreen(),
        overrides: [
          gitHubRepositoryProvider.overrideWithValue(mockRepo),
        ],
      );

      // Gõ search query
      await tester.enterText(
        find.byKey(const Key('search_field')),
        'flutter',
      );

      // Đợi debounce (500ms) + rebuild
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // Verify kết quả hiển thị
      expect(find.byKey(const Key('results_list')), findsOneWidget);
      expect(find.text('octocat'), findsOneWidget);
      expect(find.text('defunkt'), findsOneWidget);
      expect(find.text('mojombo'), findsOneWidget);
    });

    // ---- Empty results ----
    testWidgets('shows empty message when no results', (tester) async {
      when(() => mockRepo.searchUsers(any()))
          .thenAnswer((_) async => TestData.emptyResult());

      await pumpApp(
        tester,
        child: const SearchScreen(),
        overrides: [
          gitHubRepositoryProvider.overrideWithValue(mockRepo),
        ],
      );

      await tester.enterText(
        find.byKey(const Key('search_field')),
        'xyznonexistent',
      );
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('empty_view')), findsOneWidget);
      expect(find.text('No users found'), findsOneWidget);
    });

    // ---- Error state ----
    testWidgets('shows error view and retry button on failure',
            (tester) async {
          when(() => mockRepo.searchUsers(any()))
              .thenThrow(Exception('Network error'));

          await pumpApp(
            tester,
            child: const SearchScreen(),
            overrides: [
              gitHubRepositoryProvider.overrideWithValue(mockRepo),
            ],
          );

          await tester.enterText(
            find.byKey(const Key('search_field')),
            'error_trigger',
          );
          await tester.pump(const Duration(milliseconds: 600));
          await tester.pumpAndSettle();

          expect(find.byKey(const Key('error_view')), findsOneWidget);
          expect(find.byKey(const Key('retry_button')), findsOneWidget);
        });

    // ---- Retry after error ----
    testWidgets('retry button refetches data', (tester) async {
      // Lần 1: luôn throw error
      when(() => mockRepo.searchUsers(any()))
          .thenThrow(Exception('Network error'));

      await pumpApp(
        tester,
        child: const SearchScreen(),
        overrides: [
          gitHubRepositoryProvider.overrideWithValue(mockRepo),
        ],
      );

      // Gõ search → trigger error
      await tester.enterText(
        find.byKey(const Key('search_field')),
        'retry_test',
      );
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // Verify error state
      expect(find.byKey(const Key('error_view')), findsOneWidget);

      // Reset mock → lần sau trả kết quả thành công
      when(() => mockRepo.searchUsers(any()))
          .thenAnswer((_) async => TestData.searchResult());

      // Tap retry → invalidate provider → gọi lại
      await tester.tap(find.byKey(const Key('retry_button')));
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // Giờ hiển thị kết quả
      expect(find.text('octocat'), findsOneWidget);
    });

    // ---- Clear button ----
    testWidgets('clear button resets search', (tester) async {
      when(() => mockRepo.searchUsers(any()))
          .thenAnswer((_) async => TestData.searchResult());

      await pumpApp(
        tester,
        child: const SearchScreen(),
        overrides: [
          gitHubRepositoryProvider.overrideWithValue(mockRepo),
        ],
      );

      await tester.enterText(
        find.byKey(const Key('search_field')),
        'flutter',
      );
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // Verify có results
      expect(find.byKey(const Key('results_list')), findsOneWidget);

      // Tap clear
      await tester.tap(find.byKey(const Key('clear_button')));
      await tester.pumpAndSettle();

      // Quay về initial state
      expect(find.byKey(const Key('initial_view')), findsOneWidget);
    });
  });

  // ============================================================
  // Search History UI tests
  // ============================================================
  group('SearchHistory UI', () {
    testWidgets('shows history after search and clear', (tester) async {
      when(() => mockRepo.searchUsers('flutter'))
          .thenAnswer((_) async => TestData.searchResult());

      await pumpApp(
        tester,
        child: const SearchScreen(),
        overrides: [
          gitHubRepositoryProvider.overrideWithValue(mockRepo),
        ],
      );

      // Pre-populate history qua container
      final container = ProviderScope.containerOf(
        tester.element(find.byType(SearchScreen)),
      );
      container.read(searchHistoryProvider.notifier).add('dart');
      container.read(searchHistoryProvider.notifier).add('flutter');

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('history_list')), findsOneWidget);
      expect(find.text('flutter'), findsOneWidget);
      expect(find.text('dart'), findsOneWidget);
      expect(find.text('Recent Searches'), findsOneWidget);
    });
  });
}