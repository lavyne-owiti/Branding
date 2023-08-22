import 'package:branding/core/errors/failures.dart';
import 'package:branding/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:branding/features/auth/data/mapper/user.dart';

import 'package:branding/features/auth/domain/entity/user.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositortyImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositortyImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    return handleExceptions<User>(() async {
      final userModel =
          await authRemoteDataSource.loginWithEmail(email, password);
      return userModel.toEntity();
    });
  }

  @override
  Future<Either<Failure, void>> logout() {
     return handleExceptions(() {});

  }

  @override
  Future<Either<Failure, void>> register(
      String name, String email, String password, String accountType) async {
    return handleExceptions(() async {
      await authRemoteDataSource.registerAccount(name, email, password);
    });
  }
}
