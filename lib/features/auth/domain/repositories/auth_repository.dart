import 'package:branding/core/core.dart';
import 'package:branding/features/auth/domain/entity/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, void>> register(
      String name, String email, String password, String accountType);
  Future<Either<Failure, void>> logout();
}
