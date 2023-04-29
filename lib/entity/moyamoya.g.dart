// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moyamoya.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Moyamoya _$$_MoyamoyaFromJson(Map<String, dynamic> json) => _$_Moyamoya(
      moyamoyaUser: json['moyamoyaUser'] as String,
      title: json['title'] as String,
      moyamoya: json['moyamoya'] as String,
      ts: json['ts'] as String,
      slackMessageUrl: json['slackMessageUrl'] as String? ?? "",
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
      createdAt: const DateTimeConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_MoyamoyaToJson(_$_Moyamoya instance) =>
    <String, dynamic>{
      'moyamoyaUser': instance.moyamoyaUser,
      'title': instance.title,
      'moyamoya': instance.moyamoya,
      'ts': instance.ts,
      'slackMessageUrl': instance.slackMessageUrl,
      'comments': instance.comments,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
