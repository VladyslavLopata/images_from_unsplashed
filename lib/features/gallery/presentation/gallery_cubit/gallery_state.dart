part of 'gallery_cubit.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState.initial() = InitialGalleryState;
  const factory GalleryState.loading() = LoadingGalleryState;
  const factory GalleryState.successful({
    required List<ImageModel> images,
  }) = SuccessfulGalleryState;
  const factory GalleryState.error() = ErrorGalleryState;
}
