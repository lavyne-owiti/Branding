import 'package:branding/features/cart/presentation/widgets/cart_items_widget.dart';
import 'package:branding/features/home/presentation/screens/home_screen.dart';
import 'package:branding/features/payment/presentation/screens/payments_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home/presentation/widgets/bottom_nav_bar_widget.dart';

class CartScreen extends StatelessWidget {
  static String routePath = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        leading: Image.asset("assets/images/logo.png"),
        title: Text(
          'Cart',
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text('My Shooping Basket', style: TextStyle(fontSize: 15)),
          ),
         const CartItemsWidget(),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text("Total ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(" KES:975",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    context.push(HomeScreen.routePath);
                  },
                  child: const Text(
                    "Add Product",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    context.push(PaymentsScreen.routePath);
                  },
                  child: const Text(
                    "Pay",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
