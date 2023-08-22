
import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entity/user.dart';
import '../repositories/auth_repository.dart';

class Login extends UseCase<User, LoginParams> {
  AuthRepository repository;
  Login({
    required this.repository,
  });
  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return repository.login(
      params.email,
      params.password,
    );
  }
}

class LoginParams {
  String email;
  String password;


  LoginParams({
    required this.email,
    required this.password,
  });
}