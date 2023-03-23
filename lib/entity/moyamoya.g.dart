// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moyamoya.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Moyamoya _$$_MoyamoyaFromJson(Map<String, dynamic> json) => _$_Moyamoya(
      moyamoyaId: json['moyamoyaId'] as String,
      moyamoyaUser: json['moyamoyaUser'] as String,
      title: json['title'] as String,
      moyamoya: json['moyamoya'] as String,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
      createdAt: const DateTimeConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_MoyamoyaToJson(_$_Moyamoya instance) =>
    <String, dynamic>{
      'moyamoyaId': instance.moyamoyaId,
      'moyamoyaUser': instance.moyamoyaUser,
      'title': instance.title,
      'moyamoya': instance.moyamoya,
      'comments': instance.comments,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
