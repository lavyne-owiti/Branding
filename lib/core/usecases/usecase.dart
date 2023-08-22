import 'package:branding/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<R, P> {
  Future<Either<Failure, R>> call(P params);
}

abstract class NoParamsUseCase<R> {
  Future<Either<Failure, R>> call();
}

abstract class StreamUseCase<R, P> {
  Stream<Either<Failure, R>> call(P params);
}

abstract class NoParamsStreamUseCase<R> {
  Stream<Either<Failure, R>> call();
}