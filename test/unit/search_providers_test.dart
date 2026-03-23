import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:github_search_app/features/search/providers/search_providers.dart';
import 'package:github_search_app/features/search/data/user_model.dart';

import '../helpers/test_helpers.dart';

void main() {
  late MockGitHubRepository mockRepo;

  setUp(() {
    mockRepo = MockGitHubRepository();
  });

  // ============================================================
  // SearchQuery provider
  // ============================================================
  group('SearchQuery', () {
    test('initial state is empty string', () {
      final container = createContainer();
      expect(container.read(searchQueryProvider), '');
    });

    test('update changes the query', () {
      final container = createContainer();
      container.read(searchQueryProvider.notifier).update('flutter');
      expect(container.read(searchQueryProvider), 'flutter');
    });

    test('update to empty string clears query', () {
      final container = createContainer();
      container.read(searchQueryProvider.notifier).update('flutter');
      container.read(searchQueryProvider.notifier).update('');
      expect(container.read(searchQueryProvider), '');
    });
  });

  // ============================================================
  // SearchHistory provider
  // ============================================================
  group('SearchHistory', () {
    test('initial state is empty list', () {
      final container = createContainer();
      expect(container.read(searchHistoryProvider), isEmpty);
    });

    test('add appends to history', () {
      final container = createContainer();
      container.read(searchHistoryProvider.notifier).add('flutter');
      container.read(searchHistoryProvider.notifier).add('dart');

      expect(
        container.read(searchHistoryProvider),
        equals(['dart', 'flutter']), // Mới nhất trước
      );
    });

    test('add ignores empty string', () {
      final container = createContainer();
      container.read(searchHistoryProvider.notifier).add('');
      expect(container.read(searchHistoryProvider), isEmpty);
    });

    test('add ignores duplicates', () {
      final container = createContainer();
      container.read(searchHistoryProvider.notifier).add('flutter');
      container.read(searchHistoryProvider.notifier).add('flutter');

      expect(container.read(searchHistoryProvider), hasLength(1));
    });

    test('history is limited to 10 items', () {
      final container = createContainer();
      for (var i = 0; i < 15; i++) {
        container.read(searchHistoryProvider.notifier).add('query_$i');
      }
      expect(container.read(searchHistoryProvider), hasLength(10));
    });

    test('remove deletes specific item', () {
      final container = createContainer();
      container.read(searchHistoryProvider.notifier).add('flutter');
      container.read(searchHistoryProvider.notifier).add('dart');
      container.read(searchHistoryProvider.notifier).remove('flutter');

      expect(container.read(searchHistoryProvider), equals(['dart']));
    });

    test('clear empties all history', () {
      final container = createContainer();
      container.read(searchHistoryProvider.notifier).add('flutter');
      container.read(searchHistoryProvider.notifier).add('dart');
      container.read(searchHistoryProvider.notifier).clear();

      expect(container.read(searchHistoryProvider), isEmpty);
    });
  });

  // ============================================================
  // SearchResults provider (async — cần mock repo)
  // ============================================================
  group('SearchResults', () {
    test('returns empty result when query is empty', () async {
      final container = createContainer(
        overrides: [
          gitHubRepositoryProvider.overrideWithValue(mockRepo),
        ],
      );

      // Query mặc định là '' → không gọi API
      final result = await container.read(searchResultsProvider.future);

      expect(result.users, isEmpty);
      verifyNever(() => mockRepo.searchUsers(any()));
    });

    test('fetches users when query is set', () async {
      when(() => mockRepo.searchUsers('flutter'))
          .thenAnswer((_) async => TestData.searchResult());

      final container = createContainer(
        overrides: [
          gitHubRepositoryProvider.overrideWithValue(mockRepo),
          // Skip debounce trong test
          debounceDurationProvider.overrideWithValue(Duration.zero),
        ],
      );

      // Set query qua notifier
      container.read(searchQueryProvider.notifier).update('flutter');

      final result = await container.read(searchResultsProvider.future);

      expect(result.users, hasLength(3));
      expect(result.users.first.username, 'octocat');
      verify(() => mockRepo.searchUsers('flutter')).called(1);
    });

    test('propagates repository errors', () async {
      when(() => mockRepo.searchUsers('error'))
          .thenThrow(Exception('API rate limit'));

      final container = createContainer(
        overrides: [
          gitHubRepositoryProvider.overrideWithValue(mockRepo),
          debounceDurationProvider.overrideWithValue(Duration.zero),
        ],
      );

      // Giữ provider alive bằng listen thay vì read
      container.listen(searchResultsProvider, (_, _) {});

      container.read(searchQueryProvider.notifier).update('error');

      // Đợi provider settle rồi check error state
      await Future<void>.delayed(Duration.zero);

      final state = container.read(searchResultsProvider);
      expect(state.hasError, isTrue);
      expect(state.error, isA<Exception>());
    });
  });

  // ============================================================
  // Model tests
  // ============================================================
  group('GitHubUser model', () {
    test('fromJson parses correctly', () {
      final json = {
        'id': 1,
        'login': 'octocat',
        'avatar_url': 'https://example.com/avatar.png',
        'html_url': 'https://github.com/octocat',
        'public_repos': 42,
      };

      final user = GitHubUser.fromJson(json);

      expect(user.id, 1);
      expect(user.username, 'octocat');
      expect(user.avatarUrl, 'https://example.com/avatar.png');
      expect(user.repoCount, 42);
    });

    test('fromJson uses default repoCount when missing', () {
      final json = {
        'id': 1,
        'login': 'octocat',
        'avatar_url': 'https://example.com/avatar.png',
        'html_url': 'https://github.com/octocat',
      };

      final user = GitHubUser.fromJson(json);
      expect(user.repoCount, 0);
    });

    test('equality works (freezed)', () {
      final user1 = TestData.user(id: 1);
      final user2 = TestData.user(id: 1);
      final user3 = TestData.user(id: 2);

      expect(user1, equals(user2));
      expect(user1, isNot(equals(user3)));
    });
  });
}