import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/features/gallery/data/repositories/image_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'image_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final mockedDio = MockDio();
  final repository = ImageRepository(mockedDio);

  group(
    'ImageRepository tests ',
    () {
      test(
        'GIVEN correct data is passed '
        'WHEN running getAllImages '
        'THEN model should be mapped',
        () async {
          when(
            mockedDio.get(
              any,
              queryParameters: anyNamed('queryParameters'),
              cancelToken: null,
              onReceiveProgress: null,
              options: null,
            ),
          ).thenAnswer(
            (_) async => Response(
              statusCode: 200,
              data: [
                {
                  'id': '',
                  'description': 'a',
                  'urls': {
                    'regular': 'b',
                  },
                  'user': {
                    'name': 'c',
                    'username': 'd',
                  }
                }
              ],
              requestOptions: RequestOptions(
                path: '',
              ),
            ),
          );

          final data = await repository.getAllImages();

          expect(data!.first.title, 'a');
          expect(data.first.imageUrl, 'b');
          expect(data.first.author, 'c');
        },
      );

      test(
        'GIVEN status code is not 200 '
        'WHEN running getAllImages '
        'THEN no model should be mapped',
        () async {
          when(
            mockedDio.get(
              any,
              queryParameters: anyNamed('queryParameters'),
              cancelToken: null,
              onReceiveProgress: null,
              options: null,
            ),
          ).thenAnswer(
            (_) async => Response(
              statusCode: 300,
              data: [
                {
                  'id': '',
                  'description': 'a',
                  'urls': {
                    'regular': 'b',
                  },
                  'user': {
                    'name': 'c',
                    'username': 'd',
                  }
                }
              ],
              requestOptions: RequestOptions(
                path: '',
              ),
            ),
          );

          final data = await repository.getAllImages();

          expect(data, null);
        },
      );
    },
  );
}
