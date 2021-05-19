import 'package:dartz/dartz.dart';
import 'package:gallery/core/errors/failure.dart';
import 'package:gallery/core/use_cases/use_case.dart';
import 'package:gallery/features/image_presenter/domain/entities/picture.dart';
import 'package:gallery/features/image_presenter/domain/repositories/picture_repository.dart';

class GetImageData implements UseCase<List<Picture>, NoParams> {
  final PictureRepository repository;
  const GetImageData(this.repository);

  @override
  Future<Either<Failure, List<Picture>>> call(NoParams params) async {
    return repository.getPictures();
  }
}

class Params {}
