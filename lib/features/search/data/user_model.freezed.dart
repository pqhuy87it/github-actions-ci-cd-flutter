// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GitHubUser {

 int get id;@JsonKey(name: 'login') String get username;@JsonKey(name: 'avatar_url') String get avatarUrl;@JsonKey(name: 'html_url') String get profileUrl;@JsonKey(name: 'public_repos') int get repoCount;
/// Create a copy of GitHubUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GitHubUserCopyWith<GitHubUser> get copyWith => _$GitHubUserCopyWithImpl<GitHubUser>(this as GitHubUser, _$identity);

  /// Serializes this GitHubUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GitHubUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl)&&(identical(other.repoCount, repoCount) || other.repoCount == repoCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,avatarUrl,profileUrl,repoCount);

@override
String toString() {
  return 'GitHubUser(id: $id, username: $username, avatarUrl: $avatarUrl, profileUrl: $profileUrl, repoCount: $repoCount)';
}


}

/// @nodoc
abstract mixin class $GitHubUserCopyWith<$Res>  {
  factory $GitHubUserCopyWith(GitHubUser value, $Res Function(GitHubUser) _then) = _$GitHubUserCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'login') String username,@JsonKey(name: 'avatar_url') String avatarUrl,@JsonKey(name: 'html_url') String profileUrl,@JsonKey(name: 'public_repos') int repoCount
});




}
/// @nodoc
class _$GitHubUserCopyWithImpl<$Res>
    implements $GitHubUserCopyWith<$Res> {
  _$GitHubUserCopyWithImpl(this._self, this._then);

  final GitHubUser _self;
  final $Res Function(GitHubUser) _then;

/// Create a copy of GitHubUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? avatarUrl = null,Object? profileUrl = null,Object? repoCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,profileUrl: null == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String,repoCount: null == repoCount ? _self.repoCount : repoCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GitHubUser].
extension GitHubUserPatterns on GitHubUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GitHubUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GitHubUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GitHubUser value)  $default,){
final _that = this;
switch (_that) {
case _GitHubUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GitHubUser value)?  $default,){
final _that = this;
switch (_that) {
case _GitHubUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'login')  String username, @JsonKey(name: 'avatar_url')  String avatarUrl, @JsonKey(name: 'html_url')  String profileUrl, @JsonKey(name: 'public_repos')  int repoCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GitHubUser() when $default != null:
return $default(_that.id,_that.username,_that.avatarUrl,_that.profileUrl,_that.repoCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'login')  String username, @JsonKey(name: 'avatar_url')  String avatarUrl, @JsonKey(name: 'html_url')  String profileUrl, @JsonKey(name: 'public_repos')  int repoCount)  $default,) {final _that = this;
switch (_that) {
case _GitHubUser():
return $default(_that.id,_that.username,_that.avatarUrl,_that.profileUrl,_that.repoCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'login')  String username, @JsonKey(name: 'avatar_url')  String avatarUrl, @JsonKey(name: 'html_url')  String profileUrl, @JsonKey(name: 'public_repos')  int repoCount)?  $default,) {final _that = this;
switch (_that) {
case _GitHubUser() when $default != null:
return $default(_that.id,_that.username,_that.avatarUrl,_that.profileUrl,_that.repoCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GitHubUser implements GitHubUser {
  const _GitHubUser({required this.id, @JsonKey(name: 'login') required this.username, @JsonKey(name: 'avatar_url') required this.avatarUrl, @JsonKey(name: 'html_url') required this.profileUrl, @JsonKey(name: 'public_repos') this.repoCount = 0});
  factory _GitHubUser.fromJson(Map<String, dynamic> json) => _$GitHubUserFromJson(json);

@override final  int id;
@override@JsonKey(name: 'login') final  String username;
@override@JsonKey(name: 'avatar_url') final  String avatarUrl;
@override@JsonKey(name: 'html_url') final  String profileUrl;
@override@JsonKey(name: 'public_repos') final  int repoCount;

/// Create a copy of GitHubUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GitHubUserCopyWith<_GitHubUser> get copyWith => __$GitHubUserCopyWithImpl<_GitHubUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GitHubUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GitHubUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl)&&(identical(other.repoCount, repoCount) || other.repoCount == repoCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,avatarUrl,profileUrl,repoCount);

@override
String toString() {
  return 'GitHubUser(id: $id, username: $username, avatarUrl: $avatarUrl, profileUrl: $profileUrl, repoCount: $repoCount)';
}


}

/// @nodoc
abstract mixin class _$GitHubUserCopyWith<$Res> implements $GitHubUserCopyWith<$Res> {
  factory _$GitHubUserCopyWith(_GitHubUser value, $Res Function(_GitHubUser) _then) = __$GitHubUserCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'login') String username,@JsonKey(name: 'avatar_url') String avatarUrl,@JsonKey(name: 'html_url') String profileUrl,@JsonKey(name: 'public_repos') int repoCount
});




}
/// @nodoc
class __$GitHubUserCopyWithImpl<$Res>
    implements _$GitHubUserCopyWith<$Res> {
  __$GitHubUserCopyWithImpl(this._self, this._then);

  final _GitHubUser _self;
  final $Res Function(_GitHubUser) _then;

/// Create a copy of GitHubUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? avatarUrl = null,Object? profileUrl = null,Object? repoCount = null,}) {
  return _then(_GitHubUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,profileUrl: null == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String,repoCount: null == repoCount ? _self.repoCount : repoCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SearchResult {

 List<GitHubUser> get users;@JsonKey(name: 'total_count') int get totalCount;
/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultCopyWith<SearchResult> get copyWith => _$SearchResultCopyWithImpl<SearchResult>(this as SearchResult, _$identity);

  /// Serializes this SearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResult&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),totalCount);

@override
String toString() {
  return 'SearchResult(users: $users, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $SearchResultCopyWith<$Res>  {
  factory $SearchResultCopyWith(SearchResult value, $Res Function(SearchResult) _then) = _$SearchResultCopyWithImpl;
@useResult
$Res call({
 List<GitHubUser> users,@JsonKey(name: 'total_count') int totalCount
});




}
/// @nodoc
class _$SearchResultCopyWithImpl<$Res>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._self, this._then);

  final SearchResult _self;
  final $Res Function(SearchResult) _then;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<GitHubUser>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResult].
extension SearchResultPatterns on SearchResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResult value)  $default,){
final _that = this;
switch (_that) {
case _SearchResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GitHubUser> users, @JsonKey(name: 'total_count')  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
return $default(_that.users,_that.totalCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GitHubUser> users, @JsonKey(name: 'total_count')  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _SearchResult():
return $default(_that.users,_that.totalCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GitHubUser> users, @JsonKey(name: 'total_count')  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
return $default(_that.users,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResult implements SearchResult {
  const _SearchResult({final  List<GitHubUser> users = const [], @JsonKey(name: 'total_count') this.totalCount = 0}): _users = users;
  factory _SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);

 final  List<GitHubUser> _users;
@override@JsonKey() List<GitHubUser> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey(name: 'total_count') final  int totalCount;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultCopyWith<_SearchResult> get copyWith => __$SearchResultCopyWithImpl<_SearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResult&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),totalCount);

@override
String toString() {
  return 'SearchResult(users: $users, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$SearchResultCopyWith<$Res> implements $SearchResultCopyWith<$Res> {
  factory _$SearchResultCopyWith(_SearchResult value, $Res Function(_SearchResult) _then) = __$SearchResultCopyWithImpl;
@override @useResult
$Res call({
 List<GitHubUser> users,@JsonKey(name: 'total_count') int totalCount
});




}
/// @nodoc
class __$SearchResultCopyWithImpl<$Res>
    implements _$SearchResultCopyWith<$Res> {
  __$SearchResultCopyWithImpl(this._self, this._then);

  final _SearchResult _self;
  final $Res Function(_SearchResult) _then;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? totalCount = null,}) {
  return _then(_SearchResult(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<GitHubUser>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
