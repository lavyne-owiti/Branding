import 'package:flutter/material.dart';

import '../widgets/products_card_widget.dart';

class AllAddedProducts extends StatefulWidget {
  static String routePath = "/all-products";

  const AllAddedProducts({super.key});

  @override
  State<AllAddedProducts> createState() => _AllAddedProductsState();
}

class _AllAddedProductsState extends State<AllAddedProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'All Added Products',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.builder(
            itemCount: 20,
            // shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.90,
                mainAxisSpacing: 5,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) => GestureDetector(
              child: const ProductCard(
                name: 'T-Shirt',
                price: 400,
                image: 'assets/images/productimg/t-shirt.jpg',
                quantity: 20,
              ),
            ),
          ),
        ));
  }
}
