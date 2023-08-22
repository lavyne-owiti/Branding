import 'package:equatable/equatable.dart';

abstract class Failure {}

class ServerFailure extends Failure with EquatableMixin {
  final String message;
  ServerFailure(this.message);

  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {}

class CacheFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class UnexpectedResponseFailure extends Failure {}

class ServerValidationFailure extends Failure {}

class InvalidArgumentFailure extends Failure {}

class CacheDeleteFailure extends Failure {}

class InvalidArgFailure extends Failure {}

class NotFoundFailure extends Failure {}