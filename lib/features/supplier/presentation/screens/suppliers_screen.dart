import 'package:flutter/material.dart';

class SuppliersScreen extends StatelessWidget {
  static String routePath = "/suppliers";
  const SuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Suppliers'),),
    );
  }
}