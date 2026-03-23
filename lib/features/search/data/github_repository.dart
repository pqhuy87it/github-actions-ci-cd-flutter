import 'package:dio/dio.dart';
import 'user_model.dart';

/// Abstract để dễ mock trong test
abstract class GitHubRepository {
  Future<SearchResult> searchUsers(String query, {int page = 1});
}

class GitHubRepositoryImpl implements GitHubRepository {
  GitHubRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<SearchResult> searchUsers(String query, {int page = 1}) async {
    if (query.trim().isEmpty) {
      return const SearchResult();
    }

    final response = await _dio.get<Map<String, dynamic>>(
      '/search/users',
      queryParameters: {'q': query, 'page': page, 'per_page': 20},
    );

    return SearchResult(
      users: (response.data?['items'] as List<dynamic>? ?? [])
          .map((e) => GitHubUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: response.data?['total_count'] as int? ?? 0,
    );
  }
}
