import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          ElevatedButton.icon(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: const Icon(Icons.arrow_back_outlined),
            label: const Text('Sign Out'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Text(
              'Singed in as',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 8),
            Text(
              user.email!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
