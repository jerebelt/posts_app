import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/errors/errors.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}