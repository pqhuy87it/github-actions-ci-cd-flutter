// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GitHubUser _$GitHubUserFromJson(Map<String, dynamic> json) => _GitHubUser(
  id: (json['id'] as num).toInt(),
  username: json['login'] as String,
  avatarUrl: json['avatar_url'] as String,
  profileUrl: json['html_url'] as String,
  repoCount: (json['public_repos'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$GitHubUserToJson(_GitHubUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.username,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.profileUrl,
      'public_repos': instance.repoCount,
    };

_SearchResult _$SearchResultFromJson(Map<String, dynamic> json) =>
    _SearchResult(
      users:
          (json['users'] as List<dynamic>?)
              ?.map((e) => GitHubUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SearchResultToJson(_SearchResult instance) =>
    <String, dynamic>{
      'users': instance.users,
      'total_count': instance.totalCount,
    };
