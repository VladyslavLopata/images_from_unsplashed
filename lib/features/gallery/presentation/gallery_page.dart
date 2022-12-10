import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/di/service_locator.dart';
import 'package:gallery/features/gallery/data/models/image_model.dart';
import 'package:gallery/features/gallery/presentation/gallery_cubit/gallery_cubit.dart';
import 'package:go_router/go_router.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = injector<GalleryCubit>()..initialize();

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GalleryCubit, GalleryState>(
          bloc: cubit,
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                ),
              ),
              successful: (imageList) => _Body(imageList: imageList),
              error: () => const _ErrorWidget(),
            );
          },
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error Happened'),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.imageList});

  final List<ImageModel> imageList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: imageList.length,
      separatorBuilder: (_, __) => const SizedBox(height: 50),
      itemBuilder: (_, index) {
        final image = imageList[index];

        return Column(
          key: ValueKey(image.id),
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => context.pushNamed(
                'single_image',
                params: {
                  'id': image.id,
                },
              ),
              child: CachedNetworkImage(
                imageUrl: image.imageUrl,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              image.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(image.author),
          ],
        );
      },
    );
  }
}
