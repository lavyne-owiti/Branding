
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  
  const BottomNavBarWidget({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.amber,
      onTap: onTap,
      currentIndex: currentIndex,
      elevation: 0,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.black.withOpacity(0.2),
      unselectedLabelStyle: TextStyle(color: Colors.black.withOpacity(0.2)),
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(LucideIcons.heart), label: 'Favourites'),
        BottomNavigationBarItem(
            icon: Icon(LucideIcons.shoppingCart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Account')
      ],
    );
  }
}
