import 'package:dio/dio.dart';
import 'package:gallery/core/env_setup.dart';
import 'package:gallery/features/gallery/data/models/image_model.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

@singleton
class ImageRepository {
  ImageRepository(this._dio);

  final Dio _dio;

  var _storedImageList = <ImageModel>[];

  Future<Response> _requestImages() => _dio.get(
        'random',
        queryParameters: {
          'client_id': Env.clientId,
          'count': 20,
        },
      );

  String _getTitle(ImageJsonModel imageData) {
    return imageData.description ??
        imageData.altDescription ??
        'Photo by ${imageData.user.username}';
  }

  ImageModel? getImageById(String id) {
    return _storedImageList.firstWhereOrNull((element) => element.id == id);
  }

  Future<List<ImageModel>?> getAllImages() async {
    if (_storedImageList.isNotEmpty) {
      return _storedImageList;
    }

    try {
      final response = await _requestImages();
      if (response.statusCode != 200) {
        return null;
      }

      final responseList = response.data as List;

      final castList = responseList.cast<Map<String, dynamic>>();

      final imageJsonModels = castList.map(ImageJsonModel.fromJson);

      _storedImageList = imageJsonModels
          .map(
            (imageData) => ImageModel(
              id: imageData.id,
              title: _getTitle(imageData),
              author: imageData.user.name,
              imageUrl: imageData.urls.regular,
            ),
          )
          .toList();
    } catch (_) {
      return null;
    }

    return _storedImageList;
  }
}
