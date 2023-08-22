import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../repositories/auth_repository.dart';

class Logout extends NoParamsUseCase<void> {
  AuthRepository repository;
  Logout({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call() async {
    return repository.logout();
  }
}