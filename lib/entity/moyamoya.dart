import 'package:freezed_annotation/freezed_annotation.dart';

import 'firestore_converter.dart';

part 'moyamoya.freezed.dart';
part 'moyamoya.g.dart';

@freezed
abstract class Moyamoya with _$Moyamoya {
  const factory Moyamoya({
    required String moyamoyaId,
    required String moyamoyaUser,
    required String title,
    required String moyamoya,
    @Default([]) List<Map<String, String>> comments,
    @DateTimeConverter() DateTime? createdAt,
  }) = _Moyamoya;

  factory Moyamoya.fromJson(Map<String, dynamic> json) =>
      _$MoyamoyaFromJson(json);
}