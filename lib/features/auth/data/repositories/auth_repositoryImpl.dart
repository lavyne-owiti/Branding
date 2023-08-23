import 'dart:developer';

import 'package:branding/core/errors/failures.dart';
import 'package:branding/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:branding/features/auth/data/mapper/user.dart';

import 'package:branding/features/auth/domain/entity/user.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  Future<Either<Failure, void>> logout() async {
    return handleExceptions<void>(() async {
      await authRemoteDataSource.logout();
    });
  }

  @override
  Future<Either<Failure, void>> register(
      String name, String email, String password, String accountType) async {
    return handleExceptions<void>(() async {
      log('message is repo $name,$email,$password,$accountType');
      await authRemoteDataSource.registerAccount(
          name, email, password, accountType);
    });
  }

  @override
  Future<Either<Failure, User>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  return AuthRepositortyImpl(
    authRemoteDataSource: ref.watch(authRemoteDataSourceProvider),
  );
});
