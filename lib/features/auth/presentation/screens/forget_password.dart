import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routePath = "/forgotpwsd";
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        const TextSpan(text: 'Fogort Password,\n '),
                        TextSpan(
                          text: 'Reset Your Password ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    )),
                const SizedBox(height: 24),
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
                const SizedBox(height: 30),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(35)),
                    onPressed: () {},
                    child: const Text(
                      'NEXT',
                    )),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
