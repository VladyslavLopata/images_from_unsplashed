import 'package:gallery/features/gallery/presentation/gallery_page.dart';
import 'package:gallery/features/single_image/presentation/single_image_page.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RouterInjectionModule {
  @singleton
  GoRouter get router => GoRouter(
        routes: [
          GoRoute(
            path: '/',
            name: 'gallery',
            builder: (_, __) => const GalleryPage(),
          ),
          GoRoute(
            path: '/single_image/:id',
            name: 'single_image',
            builder: (_, state) => SingleImagePage(
              imageId: state.params['id'] ?? '',
            ),
          ),
        ],
      );
}
