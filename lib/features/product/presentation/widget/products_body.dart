import 'package:branding/features/product/presentation/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'categories.dart';
import 'products_card.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Explore',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
        const Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.90,
                mainAxisSpacing: 5,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => context.push(DetailsScreen.routePath),
              child: const ProductCard(
                name: 'T-Shirt',
                price: 400,
                image: 'assets/images/productimg/t-shirt.jpg',
              ),
            ),
          ),
        ))
      ],
    );
  }
}
