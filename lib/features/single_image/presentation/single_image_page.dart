import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/di/service_locator.dart';
import 'package:gallery/features/gallery/data/models/image_model.dart';
import 'package:gallery/features/single_image/presentation/single_image_cubit/single_image_cubit.dart';

class SingleImagePage extends StatelessWidget {
  const SingleImagePage({
    super.key,
    required this.imageId,
  });

  final String imageId;

  @override
  Widget build(BuildContext context) {
    final cubit = injector<SingleImageCubit>()..initialize(imageId);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SingleImageCubit, SingleImageState>(
          bloc: cubit,
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              error: () => const _ErrorWidget(),
              successful: (imageData) => _Body(imageData: imageData),
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
      child: Text('Image not found'),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.imageData});

  final ImageModel imageData;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 0.1,
      maxScale: 1.6,
      child: CachedNetworkImage(
        imageUrl: imageData.imageUrl,
      ),
    );
  }
}
