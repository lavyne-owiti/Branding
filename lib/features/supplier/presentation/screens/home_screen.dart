import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routePath = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(title: Text('Home'),),
    );
  }
}