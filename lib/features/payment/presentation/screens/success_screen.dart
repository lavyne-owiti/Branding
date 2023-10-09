import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home/presentation/screens/user_account_screen.dart';

class SuccessScreen extends StatelessWidget {
  static String routePath = '/success';
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Success')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image:const AssetImage('assets/images/success.gif'),
              // color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width * 0.32,
            ),
           const Text('Your payment was done successfully'),
           const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    context.go(UserAccountScreen.routePath);
                  },
                  child:const Text('Ok')),
            )
          ],
        ),
      ),
    );
  }
}
