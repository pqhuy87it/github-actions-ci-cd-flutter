import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:github_search_app/features/search/data/github_repository.dart';
import 'package:github_search_app/features/search/data/user_model.dart';

// ============================================================
// Mock classes
// ============================================================
class MockGitHubRepository extends Mock implements GitHubRepository {}

// ============================================================
// Mock HttpOverrides — chặn mọi NetworkImage request trong test
// ============================================================
class _TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (_, _, _) => true;
  }
}

/// Gọi trong setUp() hoặc setUpAll() để tránh lỗi NetworkImage
void setupTestEnvironment() {
  HttpOverrides.global = _TestHttpOverrides();
}

// ============================================================
// Test data factory
// ============================================================
class TestData {
  static GitHubUser user({
    int id = 1,
    String username = 'octocat',
    String avatarUrl = 'https://example.com/avatar.png',
    String profileUrl = 'https://github.com/octocat',
    int repoCount = 10,
  }) => GitHubUser(
    id: id,
    username: username,
    avatarUrl: avatarUrl,
    profileUrl: profileUrl,
    repoCount: repoCount,
  );

  static SearchResult searchResult({List<GitHubUser>? users, int? totalCount}) {
    final userList =
        users ??
        [
          user(id: 1, username: 'octocat', repoCount: 8),
          user(id: 2, username: 'defunkt', repoCount: 15),
          user(id: 3, username: 'mojombo', repoCount: 62),
        ];
    return SearchResult(
      users: userList,
      totalCount: totalCount ?? userList.length,
    );
  }

  static SearchResult emptyResult() => const SearchResult();
}

// ============================================================
// Widget test helpers
// ============================================================

/// Tạo ProviderContainer cho unit test (không cần Widget tree)
ProviderContainer createContainer({List<Override> overrides = const []}) {
  final container = ProviderContainer(overrides: overrides);
  addTearDown(container.dispose);
  return container;
}

/// Pump widget bên trong ProviderScope
Future<void> pumpApp(
  WidgetTester tester, {
  required Widget child,
  List<Override> overrides = const [],
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: overrides,
      child: MaterialApp(home: child),
    ),
  );
}
