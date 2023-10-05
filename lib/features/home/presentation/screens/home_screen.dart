import 'package:branding/features/home/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../product/presentation/screens/favourites_screen.dart';
import '../../../product/presentation/screens/products_screen.dart';
import 'user_account_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routePath = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    PageController pageController = PageController();

    @override
    void initState() {
      super.initState();
      pageController = PageController(initialPage: currentIndex);
    }

    @override
    void dispose() {
      pageController.dispose();
      super.dispose();
    }

    void changeOnTapped(int index) {
      setState(() {
        currentIndex = index;
      });
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        leading: Image.asset("assets/images/logo.png"),
        title: Text(
          'BestPro',
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
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        physics:const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: const [
          ProductScreen(),
          FavouritesScreen(),
          CartScreen(),
          UserAccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onTap: changeOnTapped,
        currentIndex: currentIndex,
      ),
    );
  }
}
