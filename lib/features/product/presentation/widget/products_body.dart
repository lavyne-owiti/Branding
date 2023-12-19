import 'package:branding/features/product/presentation/screens/details_screen.dart';
import 'package:branding/features/product/presentation/widget/products_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ProductBody extends StatelessWidget {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          onTap: () => context.push(DetailsScreen.routePath),
          child: const ProductCard(
            name: 'T-Shirt',
            price: 400,
            image: 'assets/images/productimg/t-shirt.jpg',
          ),
        ),
      ),
    );
  }
}
