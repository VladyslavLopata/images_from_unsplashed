import 'package:dartz/dartz.dart';
import 'package:gallery/core/errors/failure.dart';
import 'package:gallery/features/image_presenter/domain/entities/picture.dart';

abstract class PictureRepository {
  Future<Either<Failure, List<Picture>>> getPictures();
}
