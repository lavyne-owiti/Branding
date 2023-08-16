import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key, required this.onClickedSignUp});

  final VoidCallback onClickedSignUp;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      log('$e');
    }
    navigatorKey.currentState!.popUntil(
      (route) => route.isFirst,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: const Icon(Icons.account_box, size: 150),
              // child: Image.asset(
              //   "assets/images/logo.png",
              //   height: 150,
              // ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(35)),
                onPressed: signIn,
                child: const Text(
                  'Sign In',
                )),
            const SizedBox(height: 12),
            RichText(
                text: TextSpan(
                    text: 'No account ',
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Sign Up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary))
                ]))
          ],
        ),
      ),
    );
  }
}
