import 'dart:developer';

import 'package:branding/core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> loginWithEmail(
    String email,
    String password,
  );

  Future<void> registerAccount(
    String name,
    String email,
    String password,
    String accountType,
  );
  Future<void> getUsers(String accountType);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  NetworkInfo networkInfo;

  AuthRemoteDataSourceImpl({required this.networkInfo});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final user = FirebaseAuth.instance.currentUser;

  @override
  Future<UserModel> loginWithEmail(String email, String password) async {
    return handleErrors<UserModel>(() async {
      if (!await networkInfo.isConnected) throw NetworkException();
      final authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final uid = authResult.user!.uid;
      final userDocSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final userData = userDocSnapshot.data() as Map<String, dynamic>;
      final userModel = UserModel.fromJson(userData);

      return userModel;
   

    });
  }

  @override
  Future<void> registerAccount(
      String name, String email, String password, String accountType) async {
    log('message on top');
    return handleErrors<void>(() async {
      log('message is remote db $name,$email,$password,$accountType');
      var userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCollection.doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'accountType': accountType,
      });
    });
  }

  @override
  Future<void> getUsers(String accountType) async {
    return handleErrors<void>(() async {
      final querySnapshot = await userCollection
          .where('accountType', isEqualTo: accountType)
          .get();

      querySnapshot.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<void> logout() async {
    return handleErrors<void>(() async {
      await FirebaseAuth.instance.signOut();
    });
  }
}

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(
    networkInfo: ref.watch(networkInfoProvider),
  );
});
