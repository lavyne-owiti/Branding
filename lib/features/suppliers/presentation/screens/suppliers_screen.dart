import 'package:branding/features/suppliers/presentation/screens/all_added_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'add_product.dart';

class SuppliersScreen extends StatelessWidget {
  static String routePath = "/suppliers";
  const SuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suppliers',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          OutlinedButton(
            onPressed: () {
              context.push(AllAddedProducts.routePath);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
            child: const Text(
              'View Products',
              style: TextStyle(color: Colors.white),
            ),
          ),
          OutlinedButton(
              onPressed: () {
                context.push(AddProductScreen.routePath);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              child: const Text(
                'Add Products',
                style: TextStyle(color: Colors.white),
              )),
        ]),
      ),
    );
  }
}
