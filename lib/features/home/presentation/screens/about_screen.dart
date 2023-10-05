import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static String routePath = 'about';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
    );
  }
}
