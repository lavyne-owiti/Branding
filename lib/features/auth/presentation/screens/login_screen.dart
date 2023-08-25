import 'dart:developer';

import 'package:branding/features/auth/presentation/screens/forget_password.dart';
import 'package:branding/features/auth/presentation/screens/singup_screen.dart';
import 'package:branding/features/auth/presentation/state/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../product/presentation/screens/home_screen.dart';
import '../../../product/presentation/screens/suppliers_screen.dart';
import '../controllers/account_type_controller.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String routePath = "/login";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future login() async {
    if (_formKey.currentState!.validate()) {
      var authController = ref.watch(authStateProvider.notifier);
      // var accountType = ref.watch(accountTypeProvider);

      authController.login(
        email: emailController.text,
        password: passwordController.text,
      );
      // if (accountType != AccountType.individual) {
      //   context.go(SuppliersScreen.routePath);
      // } else {
      //   context.go(HomeScreen.routePath);
      // }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, state) {
      if (state is LoginError) {
        state.failure;
      }
      if (state is LoggingIn) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
        context.go(HomeScreen.routePath);
      }
      if (state is Authenticated) {
        context.go(HomeScreen.routePath);
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  // child: const Icon(Icons.account_box, size: 150),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 150,
                  ),
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor),
                      children: [
                        const TextSpan(text: 'Hey There,\n '),
                        TextSpan(
                          text: 'Welcome Back',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    )),
                const SizedBox(height: 20),
                TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail_outline),
                      // hintText: 'Email',
                    ),
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
                const SizedBox(height: 4),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.fingerprint),
                      suffixIcon: Icon(Icons.remove_red_eye_sharp)),
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
                GestureDetector(
                  onTap: () {
                    context.go(ForgotPasswordScreen.routePath);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password?',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        )),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(35)),
                    onPressed: login,
                    child: const Text(
                      'LOGIN',
                    )),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    context.go(SignUpScreen.routePath);
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "Don't have an Account? ",
                          style: const TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).primaryColor))
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
