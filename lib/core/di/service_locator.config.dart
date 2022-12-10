// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:gallery/core/http_client/dio.dart' as _i8;
import 'package:gallery/core/router/router.dart' as _i9;
import 'package:gallery/features/gallery/data/repositories/image_repository.dart'
    as _i5;
import 'package:gallery/features/gallery/presentation/gallery_cubit/gallery_cubit.dart'
    as _i7;
import 'package:gallery/features/single_image/presentation/single_image_cubit/single_image_cubit.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final httpClientInjectionModule = _$HttpClientInjectionModule();
    final routerInjectionModule = _$RouterInjectionModule();
    gh.singleton<_i3.Dio>(httpClientInjectionModule.dio);
    gh.singleton<_i4.GoRouter>(routerInjectionModule.router);
    gh.singleton<_i5.ImageRepository>(_i5.ImageRepository(gh<_i3.Dio>()));
    gh.factory<_i6.SingleImageCubit>(
        () => _i6.SingleImageCubit(gh<_i5.ImageRepository>()));
    gh.factory<_i7.GalleryCubit>(
        () => _i7.GalleryCubit(gh<_i5.ImageRepository>()));
    return this;
  }
}

class _$HttpClientInjectionModule extends _i8.HttpClientInjectionModule {}

class _$RouterInjectionModule extends _i9.RouterInjectionModule {}
