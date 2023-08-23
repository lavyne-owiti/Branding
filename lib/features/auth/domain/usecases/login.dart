
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../data/repositories/auth_repositoryImpl.dart';
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


final loginUseCaseProvider = Provider.autoDispose<Login>((ref) {
  return Login(
    repository: ref.watch(authRepositoryProvider),
  );
});