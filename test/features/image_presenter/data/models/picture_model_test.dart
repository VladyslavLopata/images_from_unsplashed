import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/features/image_presenter/data/models/picture_model.dart';
import 'package:gallery/features/image_presenter/domain/entities/picture.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tPictureModel = PictureModel(
    author: 'Chris Henry',
    title: 'Sea',
    url: 'https://image.com/image.png\u0026',
  );

  test('should be subclass of Picture', () {
    expect(tPictureModel, isA<Picture>());
  });

  group('fromJson', () {
    test('should convert url correctly', () {
      const url = 'https://image.com/image.png\u0026';
      final jsonMap =
          jsonDecode(fixture('picture.json')).first as Map<String, dynamic>;

      final actualUrl = convertURL(jsonMap['urls'] as Map<String, dynamic>);

      expect(actualUrl, url);
    });
    test('should convert author from description correctly', () {
      const author = 'Chris Henry';
      final jsonMap =
          jsonDecode(fixture('picture.json')).first as Map<String, dynamic>;

      final actualAuthor =
          convertAuthor(jsonMap['user'] as Map<String, dynamic>);

      expect(actualAuthor, author);
    });
    test('should return a valid model', () {
      final jsonMap =
          jsonDecode(fixture('picture.json')).first as Map<String, dynamic>;
      final picture = PictureModel.fromJson(jsonMap);
      expect(picture, tPictureModel);
    });
  });
}
