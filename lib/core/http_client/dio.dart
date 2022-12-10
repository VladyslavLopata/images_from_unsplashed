import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpClientInjectionModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://api.unsplash.com/photos/',
        ),
      );
}
