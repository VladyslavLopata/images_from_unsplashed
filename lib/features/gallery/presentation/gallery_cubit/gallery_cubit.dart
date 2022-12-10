import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/features/gallery/data/models/image_model.dart';
import 'package:gallery/features/gallery/data/repositories/image_repository.dart';
import 'package:injectable/injectable.dart';

part 'gallery_state.dart';
part 'gallery_cubit.freezed.dart';

@injectable
class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit(this._imageRepository) : super(const GalleryState.initial());

  final ImageRepository _imageRepository;

  Future<void> initialize() async {
    emit(const GalleryState.loading());

    final imageList = await _imageRepository.getAllImages();

    if (imageList == null || imageList.isEmpty) {
      emit(const GalleryState.error());
    } else {
      emit(
        GalleryState.successful(
          images: imageList,
        ),
      );
    }
  }
}
