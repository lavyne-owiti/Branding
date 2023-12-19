// import 'package:branding/features/product/presentation/widget/categories.dart';
import 'package:branding/features/product/presentation/widget/products_body.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static String routePath = "/product";
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(top: 8.0),
        //   child: Text(
        //     'Explore',
        //     style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold,
        //         color: Theme.of(context).primaryColor),
        //   ),
        // ),
        //  Categories(),
         Expanded(child: ProductBody()),
      ],
    ));
  }
}
