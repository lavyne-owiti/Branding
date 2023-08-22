import 'package:branding/core/core.dart';
import 'package:branding/core/network/network_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  );
  Future<void> getUsers(String accountType);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  NetworkInfo networkInfo;

  AuthRemoteDataSourceImpl({required this.networkInfo});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<UserModel> loginWithEmail(String email, String password) async {
    return handleErrors<UserModel>(() async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final userDoc = await userCollection.doc(email).get();
      if (userDoc.exists) {
        final userData = userDoc.data() as Map<String, dynamic>;
        return UserModel.fromJson(userData);
      } else {
        throw FirebaseException(message: 'User not found', plugin: '');
      }
    });
  }

  @override
  Future<void> registerAccount(
      String name, String email, String password) async {
    return handleErrors<void>(() async {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCollection.doc(email).set({
        'name': name,
        'email': email,
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
}
