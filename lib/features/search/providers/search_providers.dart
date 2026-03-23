import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/github_repository.dart';
import '../data/user_model.dart';

part 'search_providers.g.dart';

// ============================================================
// 1. Dio provider
// ============================================================
@riverpod
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.github.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Accept': 'application/vnd.github.v3+json'},
    ),
  );

  ref.onDispose(dio.close);
  return dio;
}

// ============================================================
// 2. Repository provider — CI sẽ override cái này bằng mock
// ============================================================
@riverpod
GitHubRepository gitHubRepository(Ref ref) {
  return GitHubRepositoryImpl(ref.watch(dioProvider));
}

// ============================================================
// 3a. Debounce duration — override thành Duration.zero trong test
// ============================================================
@riverpod
Duration debounceDuration(Ref ref) => const Duration(milliseconds: 500);

// ============================================================
// 3b. Search query state — người dùng gõ gì
// ============================================================
@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void update(String query) => state = query;
}

// ============================================================
// 4. Search results — auto-fetch khi query thay đổi
//    Đây là provider chính mà CI test sẽ verify
// ============================================================
@riverpod
Future<SearchResult> searchResults(Ref ref) async {
  final query = ref.watch(searchQueryProvider);

  if (query.isEmpty) return const SearchResult();

  // Debounce — trong test override thành Duration.zero
  final debounce = ref.read(debounceDurationProvider);
  if (debounce > Duration.zero) {
    await Future<void>.delayed(debounce);
    if (!ref.mounted) return const SearchResult();
  }

  final repo = ref.read(gitHubRepositoryProvider);
  return repo.searchUsers(query);
}

// ============================================================
// 5. Search history — lưu local (đơn giản cho demo)
// ============================================================
@riverpod
class SearchHistory extends _$SearchHistory {
  @override
  List<String> build() => [];

  void add(String query) {
    if (query.isNotEmpty && !state.contains(query)) {
      state = [query, ...state].take(10).toList();
    }
  }

  void remove(String query) {
    state = state.where((q) => q != query).toList();
  }

  void clear() => state = [];
}
