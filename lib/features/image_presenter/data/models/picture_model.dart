import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/features/image_presenter/domain/entities/picture.dart';

part 'picture_model.freezed.dart';
part 'picture_model.g.dart';

String convertURL(Map<String, dynamic> json) => json['regular'] as String;
String convertAuthor(Map<String, dynamic> json) => json['name'] as String;

@freezed
class PictureModel with _$PictureModel implements Picture {
  const factory PictureModel({
    @JsonKey(name: 'urls', fromJson: convertURL) required String url,
    @JsonKey(name: 'user', fromJson: convertAuthor) required String author,
    @JsonKey(name: 'description') @Default('') String title,
  }) = _PictureModel;

  factory PictureModel.fromJson(Map<String, dynamic> json) =>
      _$PictureModelFromJson(json);
}
