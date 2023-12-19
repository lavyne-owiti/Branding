import 'package:branding/config/constants.dart';
import 'package:branding/features/home/presentation/screens/about_screen.dart';
import 'package:branding/features/payment/presentation/screens/messages_screen.dart';
import 'package:branding/features/payment/presentation/screens/payments_screen.dart';
import 'package:branding/features/product/presentation/screens/my_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_nav_bar_widget.dart';

class UserAccountScreen extends StatelessWidget {
  static String routePath = '/user-account';
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBarWidget(),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    height: 250.0,
                    child: Image.asset(
                      'assets/images/background.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: MediaQuery.of(context).size.width * 0.32,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 1)),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text('Username',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: labels.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(icons[index],
                        color: Theme.of(context).primaryColor),
                    title: Text(
                      labels[index],
                    ),
                    onTap: () {
                      switch (labels[index]) {
                        case 'Payments':
                          context.push(PaymentsScreen.routePath);
                          break;
                        case 'Messages':
                          context.push(MessagesScreen.routePath);
                          break;
                        case 'My Orders':
                          context.push(MyOrdersScreen.routePath);
                          break;
                        case 'About':
                          context.push(AboutScreen.routePath);
                          break;
                        case 'Logout':
                          signOutDrawer(context);
                          break;
                        default:
                          break;
                      }
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

void signOutDrawer(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          color: Theme.of(context).primaryColor,
          height: 150.0,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Are you sure you want Logout ?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Colors.white,
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
