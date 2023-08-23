import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../data/repositories/auth_repositoryImpl.dart';
import '../repositories/auth_repository.dart';

class Register extends UseCase<void, RegisterParams> {
  AuthRepository repository;
  Register({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    return repository.register(
        params.name, params.email, params.password, params.accountType);
  }
}

class RegisterParams {
  String name;
  String email;
  String password;
  String accountType;
  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.accountType,
  });
}

final registerUseCaseProvider = Provider.autoDispose<Register>(
  (ref) => Register(
    repository: ref.watch(authRepositoryProvider),
  ),
);
