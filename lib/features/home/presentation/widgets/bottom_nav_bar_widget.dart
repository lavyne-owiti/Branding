import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../product/presentation/screens/favourites_screen.dart';
import '../screens/home_screen.dart';
import '../screens/user_account_screen.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final currentIndex = _getCurrentIndex(router);

    void onItemTapped(int index) {
      if (index == currentIndex) {
        return;
      }

      switch (index) {
        case 0:
          context.go(HomeScreen.routePath);
          break;
        case 1:
          context.push(FavouritesScreen.routePath);
          break;
        case 2:
          context.push(CartScreen.routePath);
          break;
        case 3:
          context.push(UserAccountScreen.routePath);
          break;
        default:
          break;
      }
    }

    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(
        color: Color(0xff1818AD),
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: TextStyle(color: Colors.black.withOpacity(0.2)),
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromRGBO(249, 249, 249, 0.80),
      selectedItemColor: currentIndex == -1
          ? const Color.fromRGBO(0, 0, 0, 0.60)
          : Theme.of(context).primaryColor,
      unselectedItemColor: Colors.black.withOpacity(0.2),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: onItemTapped,
      currentIndex: currentIndex == -1 ? 0 : currentIndex,
      elevation: 0,
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
  

  int _getCurrentIndex(
    GoRouter router,
  ) {
    if (router.location == HomeScreen.routePath) {
      return 0;
    } else if (router.location == FavouritesScreen.routePath) {
      return 1;
    } else if (router.location == CartScreen.routePath) {
      return 2;
    } else if (router.location == UserAccountScreen.routePath) {
      return 3;
    } else {
      // -1 means no match
      return -1;
    }
  }
}
