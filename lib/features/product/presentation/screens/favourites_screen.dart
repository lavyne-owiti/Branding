import 'package:branding/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home/presentation/widgets/bottom_nav_bar_widget.dart';

class FavouritesScreen extends StatelessWidget {
  static String routePath = '/favourites';
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        leading: Image.asset("assets/images/logo.png"),
        title: Text(
          'Favorites',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              context.push(CartScreen.routePath);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
