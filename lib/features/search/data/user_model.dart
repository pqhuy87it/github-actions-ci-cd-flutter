import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class GitHubUser with _$GitHubUser {
  const factory GitHubUser({
    required int id,
    @JsonKey(name: 'login') required String username,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'html_url') required String profileUrl,
    @Default(0) @JsonKey(name: 'public_repos') int repoCount,
  }) = _GitHubUser;

  factory GitHubUser.fromJson(Map<String, dynamic> json) =>
      _$GitHubUserFromJson(json);
}

@freezed
abstract class SearchResult with _$SearchResult {
  const factory SearchResult({
    @Default([]) List<GitHubUser> users,
    @Default(0) @JsonKey(name: 'total_count') int totalCount,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}