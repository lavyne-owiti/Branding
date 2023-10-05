import 'package:branding/features/cart/presentation/screens/cart_screen.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';

class CartFeature extends Feature {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: CartScreen.routePath,
          builder: (context, state) => const CartScreen(),
        ),
      ];
  // @override
  // Future<void> preregister() async {
  //   Hive.registerAdapter(UserModelAdapter());
  // }
}
