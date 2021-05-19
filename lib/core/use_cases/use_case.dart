import 'package:dartz/dartz.dart';
import 'package:gallery/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

class NoParams {
  @override
  bool operator ==(Object other) => true;

  @override
  int get hashCode => 0;
}
