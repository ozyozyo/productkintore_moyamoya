// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moyamoya.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Moyamoya _$MoyamoyaFromJson(Map<String, dynamic> json) {
  return _Moyamoya.fromJson(json);
}

/// @nodoc
mixin _$Moyamoya {
  String get moyamoyaUser => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get moyamoya => throw _privateConstructorUsedError;
  String get ts => throw _privateConstructorUsedError;
  List<Map<String, String>> get comments => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoyamoyaCopyWith<Moyamoya> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoyamoyaCopyWith<$Res> {
  factory $MoyamoyaCopyWith(Moyamoya value, $Res Function(Moyamoya) then) =
      _$MoyamoyaCopyWithImpl<$Res, Moyamoya>;
  @useResult
  $Res call(
      {String moyamoyaUser,
      String title,
      String moyamoya,
      String ts,
      List<Map<String, String>> comments,
      @DateTimeConverter() DateTime? createdAt});
}

/// @nodoc
class _$MoyamoyaCopyWithImpl<$Res, $Val extends Moyamoya>
    implements $MoyamoyaCopyWith<$Res> {
  _$MoyamoyaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moyamoyaUser = null,
    Object? title = null,
    Object? moyamoya = null,
    Object? ts = null,
    Object? comments = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      moyamoyaUser: null == moyamoyaUser
          ? _value.moyamoyaUser
          : moyamoyaUser // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      moyamoya: null == moyamoya
          ? _value.moyamoya
          : moyamoya // ignore: cast_nullable_to_non_nullable
              as String,
      ts: null == ts
          ? _value.ts
          : ts // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoyamoyaCopyWith<$Res> implements $MoyamoyaCopyWith<$Res> {
  factory _$$_MoyamoyaCopyWith(
          _$_Moyamoya value, $Res Function(_$_Moyamoya) then) =
      __$$_MoyamoyaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String moyamoyaUser,
      String title,
      String moyamoya,
      String ts,
      List<Map<String, String>> comments,
      @DateTimeConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_MoyamoyaCopyWithImpl<$Res>
    extends _$MoyamoyaCopyWithImpl<$Res, _$_Moyamoya>
    implements _$$_MoyamoyaCopyWith<$Res> {
  __$$_MoyamoyaCopyWithImpl(
      _$_Moyamoya _value, $Res Function(_$_Moyamoya) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moyamoyaUser = null,
    Object? title = null,
    Object? moyamoya = null,
    Object? ts = null,
    Object? comments = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Moyamoya(
      moyamoyaUser: null == moyamoyaUser
          ? _value.moyamoyaUser
          : moyamoyaUser // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      moyamoya: null == moyamoya
          ? _value.moyamoya
          : moyamoya // ignore: cast_nullable_to_non_nullable
              as String,
      ts: null == ts
          ? _value.ts
          : ts // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Moyamoya implements _Moyamoya {
  const _$_Moyamoya(
      {required this.moyamoyaUser,
      required this.title,
      required this.moyamoya,
      required this.ts,
      final List<Map<String, String>> comments = const [],
      @DateTimeConverter() this.createdAt})
      : _comments = comments;

  factory _$_Moyamoya.fromJson(Map<String, dynamic> json) =>
      _$$_MoyamoyaFromJson(json);

  @override
  final String moyamoyaUser;
  @override
  final String title;
  @override
  final String moyamoya;
  @override
  final String ts;
  final List<Map<String, String>> _comments;
  @override
  @JsonKey()
  List<Map<String, String>> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  @DateTimeConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Moyamoya(moyamoyaUser: $moyamoyaUser, title: $title, moyamoya: $moyamoya, ts: $ts, comments: $comments, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Moyamoya &&
            (identical(other.moyamoyaUser, moyamoyaUser) ||
                other.moyamoyaUser == moyamoyaUser) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.moyamoya, moyamoya) ||
                other.moyamoya == moyamoya) &&
            (identical(other.ts, ts) || other.ts == ts) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, moyamoyaUser, title, moyamoya,
      ts, const DeepCollectionEquality().hash(_comments), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoyamoyaCopyWith<_$_Moyamoya> get copyWith =>
      __$$_MoyamoyaCopyWithImpl<_$_Moyamoya>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoyamoyaToJson(
      this,
    );
  }
}

abstract class _Moyamoya implements Moyamoya {
  const factory _Moyamoya(
      {required final String moyamoyaUser,
      required final String title,
      required final String moyamoya,
      required final String ts,
      final List<Map<String, String>> comments,
      @DateTimeConverter() final DateTime? createdAt}) = _$_Moyamoya;

  factory _Moyamoya.fromJson(Map<String, dynamic> json) = _$_Moyamoya.fromJson;

  @override
  String get moyamoyaUser;
  @override
  String get title;
  @override
  String get moyamoya;
  @override
  String get ts;
  @override
  List<Map<String, String>> get comments;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MoyamoyaCopyWith<_$_Moyamoya> get copyWith =>
      throw _privateConstructorUsedError;
}
