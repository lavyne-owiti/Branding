// import 'dart:developer';

// import 'package:branding/zample/main.dart';
import 'package:branding/zample/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key, required this.onClickedSignUp});
  final VoidCallback onClickedSignUp;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future signIn() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
    // navigatorKey.currentState!.popUntil(
    //   (route) => route.isFirst,
    // );
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
        child: Form(
          key: _formKey,
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
              RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue,
                    ),
                    children: [
                      TextSpan(text: 'Hey There,\n '),
                      TextSpan(
                        text: 'Welcome Back',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Enter your email address';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  }),
              const SizedBox(height: 4),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (password) {
                  if (password == null || password.trim().isEmpty) {
                    return 'This field is required';
                  }
                  if (password.trim().length < 8) {
                    return 'Password must be at least 8 characters in length';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(35)),
                  onPressed: signIn,
                  child: const Text(
                    'Sign Up',
                  )),
              const SizedBox(height: 12),
              RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: 'LogIn',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).primaryColor))
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
