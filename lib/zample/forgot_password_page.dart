import 'dart:developer';

import 'package:branding/zample/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future resetPassword() async {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      Utils.showSnackBar('Password Reset Email Sent');
      // Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      log('$e');
      Utils.showSnackBar(e.message);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: formKey,
            child: Column(
              children: [
              const  SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: Text('Recieve an email to reset your password',
                      style: TextStyle(
                          fontSize: 17, color: Theme.of(context).primaryColor)),
                ),
               const SizedBox(height: 30),
                TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(labelText: 'Email'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Enter your email address';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    }),
                const SizedBox(height: 40),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(35)),
                    onPressed: resetPassword,
                    child: const Text(
                      'Reset Password',
                    )),
              ],
            )),
      ),
    );
  }
}
