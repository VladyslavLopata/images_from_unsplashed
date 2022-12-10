import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/features/gallery/data/models/image_model.dart';
import 'package:gallery/features/gallery/data/repositories/image_repository.dart';
import 'package:injectable/injectable.dart';

part 'single_image_state.dart';
part 'single_image_cubit.freezed.dart';

@injectable
class SingleImageCubit extends Cubit<SingleImageState> {
  SingleImageCubit(this._imageRepository)
      : super(const SingleImageState.initial());

  final ImageRepository _imageRepository;

  Future<void> initialize(String id) async {
    final imageData = _imageRepository.getImageById(id);

    if (imageData == null) {
      emit(const SingleImageState.error());
    } else {
      emit(
        SingleImageState.successful(
          imageData: imageData,
        ),
      );
    }
  }
}
