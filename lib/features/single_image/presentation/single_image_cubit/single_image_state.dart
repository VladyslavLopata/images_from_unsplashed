part of 'single_image_cubit.dart';

@freezed
class SingleImageState with _$SingleImageState {
  const factory SingleImageState.initial() = InitialSingleImageState;
  const factory SingleImageState.successful({
    required ImageModel imageData,
  }) = SuccessfulSingleImageState;
  const factory SingleImageState.error() = ErrorSingleImageState;
}
