import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../repositories/auth_repository.dart';

class Register extends UseCase<void, RegisterParams> {
  AuthRepository repository;
  Register({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    return repository.register(
      params.name,
      params.email,
      params.password,
      params.userType
    );
  }
}

class RegisterParams {
  String name;
  String email;
  String password;
  String userType;
  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.userType,
  });
}