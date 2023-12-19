import 'package:branding/features/home/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../auth/presentation/state/auth_state.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../product/presentation/screens/products_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String routePath = '/home';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
     ref.listen(authStateProvider, (previous, next) async {
      if (next is Unauthenticated) {
        context.go(LoginScreen.routePath);
        await ref.read(authStateProvider.notifier).logout();
      }
    });
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
            onPressed: () {
              context.push(CartScreen.routePath);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Hello Lavyne,Welcome Back!',
                style: TextStyle(fontSize: 15)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: 360,
              decoration: BoxDecoration(
                color: const Color(0xffD2D2F1).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/props promo.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "10% Discount",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1818AD),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "All new users get discounts \nafter purchase",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categories',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryContainerWidget(
                  ontap: () => context.push(ProductScreen.routePath),
                  image: 'assets/images/product.png',
                  name: 'Product'),
              CategoryContainerWidget(
                  ontap: () => context.push(ProductScreen.routePath),
                  image: 'assets/images/crafts.png',
                  name: 'Crafts'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryContainerWidget(
                  ontap: () => context.push(ProductScreen.routePath),
                  image: 'assets/images/promo products.png',
                  name: 'Promotional Products'),
              CategoryContainerWidget(
                  ontap: () => context.push(ProductScreen.routePath),
                  image: 'assets/images/services.png',
                  name: 'Services'),
            ],
          ),
        ],
      ),
      bottomNavigationBar:const BottomNavBarWidget(),
    );
  }
}

class CategoryRowWidget extends StatelessWidget {
  const CategoryRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategoryContainerWidget(
            ontap: () => context.push(ProductScreen.routePath),
            image: 'assets/images/product.png',
            name: 'Product'),
        CategoryContainerWidget(
            ontap: () => context.push(ProductScreen.routePath),
            image: 'assets/images/crafts.png',
            name: 'Crafts'),
      ],
    );
  }
}

class CategoryContainerWidget extends StatelessWidget {
  final String image;
  final String name;
  final Function() ontap;
  const CategoryContainerWidget({
    required this.image,
    required this.name,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          height: 150,
          width: 160,
          // padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image, height: 120, width: 120),
              Text(
                name,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )),
    );
  }
}
