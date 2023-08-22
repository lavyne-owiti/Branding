import 'dart:developer';

import 'package:branding/core/errors/exceptions.dart';
import 'package:branding/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

var validExceptions = [
  CacheException,
  NetworkException,
  InvalidArgumentException,
  ServerException,
];

Future<Either<Failure, T>> handleExceptions<T>(
    Future<T> Function() asyncFunction) async {
  try {
    return Right(await asyncFunction());
  } catch (error) {
    log("Exception: $error");
    if (error is CacheException) {
      return Left(CacheFailure());
    } else if (error is NetworkException) {
      return Left(NetworkFailure());
    } else if (error is ServerException) {
      return Left(ServerFailure(error.message));
    } else {
      return Left(InvalidArgumentFailure());
    }
  }
}

Future<T> handleErrors<T>(Future<T> Function() asyncFunction) async {
  try {
    return await asyncFunction();
  } catch (error, stackTrace) {
    log("Error: $error");
    if (validExceptions.contains(error.runtimeType)) {
      rethrow;
    }

    if (error is FirebaseException) {
      debugPrint("Firebase error: ${error.message}, $stackTrace");

      if (error.message != null) {
        final errorMessage = error.message is List
            ? (error.message as List).first.toString()
            : error.message.toString();

        throw ServerException(
          message: errorMessage,
        );
      }

      String message = error.message ?? "An error occured";
      throw ServerException(
        message: message,
      );
    }

    if (error is HiveError) {
      debugPrint("Hive error: ${error.message}, $stackTrace");
      throw CacheException();
    }

    debugPrint(
      'Uncought error: $error, $stackTrace',
    );
    throw InvalidArgumentException();
  }
}
