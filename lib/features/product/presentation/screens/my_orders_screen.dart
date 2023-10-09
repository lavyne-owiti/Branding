import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  static String routePath = '/my-orders';
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('My Orders'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/orders.png',
                width: MediaQuery.of(context).size.width * 0.42),
           const Text('No orders made', style: TextStyle(fontSize: 24))
          ],
        ),
      ),
    );
  }
}
