import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/core/use_cases/use_case.dart';
import 'package:gallery/features/image_presenter/domain/entities/picture.dart';
import 'package:gallery/features/image_presenter/domain/repositories/picture_repository.dart';
import 'package:gallery/features/image_presenter/domain/use_cases/get_image_data.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_image_data_test.mocks.dart';

@GenerateMocks([PictureRepository])
void main() {
  late PictureRepository repository;
  late GetImageData getImageData;

  setUp(() {
    repository = MockPictureRepository();
    getImageData = GetImageData(repository);
  });

  final pictures = [
    Picture(url: 'url', title: 'name', author: 'author'),
  ];

  test('should return image data', () async {
    //init
    when(repository.getPictures()).thenAnswer((_) async => Right(pictures));
    //act
    final result = await getImageData(NoParams());
    //assert
    expect(result, Right(pictures));

    verify(repository.getPictures());

    verifyNoMoreInteractions(repository);
  });
}
