import 'dart:developer';

import 'package:branding/features/auth/presentation/controllers/account_type_controller.dart';
import 'package:branding/features/auth/presentation/controllers/auth_controller.dart';
import 'package:branding/features/auth/presentation/screens/login_screen.dart';
import 'package:branding/features/auth/presentation/state/auth_state.dart';
import 'package:branding/features/supplier/presentation/screens/home_screen.dart';
import 'package:branding/features/supplier/presentation/screens/suppliers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/account_type_select.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static String routePath = "/signup";
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future signUp() async {
    if (_formKey.currentState!.validate()) {
      var authController = ref.watch(authStateProvider.notifier);
      var accoutType = ref.watch(accountTypeProvider);
      var authState = ref.watch(authStateProvider);

      if (authState is Registering && accoutType.name == 'business') {
        authController.register(
          email: emailController.text,
          name: nameController.text,
          password: passwordController.text,
          accountType: accoutType.name,
        );
        log('message is from creen ${emailController.text}');
        log('message is from creen ${nameController.text}');
        log('message is from creen ${passwordController.text}');
        log('message is from creen ${accoutType.name}');

        context.go(SuppliersScreen.routePath);
      } else {
        context.go(HomeScreen.routePath);
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, state) {
      if (state is RegistrationError) {
        state.failure;
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
                        const TextSpan(text: 'Get On Board,\n '),
                        TextSpan(
                          text: 'Create Your Profile To Start',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    )),
                const SizedBox(height: 24),
                TextFormField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail_outline),
                      hintText: 'Email',
                      border: OutlineInputBorder(),
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
                const SizedBox(height: 8),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.fingerprint),
                    suffixIcon: Icon(Icons.remove_red_eye_sharp),
                    border: OutlineInputBorder(),
                  ),
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
                const AccountTypeSelectView(),
                const SizedBox(height: 40),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(35)),
                    onPressed: signUp,
                    child: const Text(
                      'SINGUP',
                    )),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    context.go(LoginScreen.routePath);
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "Already have an Account? ",
                          style: const TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            text: 'Login',
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
