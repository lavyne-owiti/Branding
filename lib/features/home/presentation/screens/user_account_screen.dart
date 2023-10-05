import 'package:branding/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class UserAccountScreen extends StatelessWidget {
  static String routePath = '/user-account';
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      'assets/images/laptopchair.jpg',
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
                    onTap: () {},
                  );
                }),
          ),
        ],
      ),
    );
  }
}
