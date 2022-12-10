import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required String id,
    required String title,
    required String author,
    required String imageUrl,
  }) = _ImageModel;
}

@freezed
class ImageJsonModel with _$ImageJsonModel {
  const factory ImageJsonModel({
    required String id,
    required UrlModel urls,
    String? description,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'alt_description') String? altDescription,
    required UserModel user,
  }) = _ImageJsonModel;

  factory ImageJsonModel.fromJson(Map<String, dynamic> json) =>
      _$ImageJsonModelFromJson(json);
}

@freezed
class UrlModel with _$UrlModel {
  const factory UrlModel({
    required String regular,
  }) = _UrlModel;

  factory UrlModel.fromJson(Map<String, dynamic> json) =>
      _$UrlModelFromJson(json);
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String username,
    required String name,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
