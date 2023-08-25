import 'package:branding/features/product/presentation/widget/products_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routePath = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body:const ProductBody(),
    );
  }
}
