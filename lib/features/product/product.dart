import 'package:branding/features/product/presentation/screens/details_screen.dart';
import 'package:branding/features/product/presentation/screens/favourites_screen.dart';
import 'package:branding/features/product/presentation/screens/products_screen.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import 'presentation/screens/my_orders_screen.dart';

class ProductFeature extends Feature {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: ProductScreen.routePath,
          builder: (context, state) => const ProductScreen(),      
        ),     
        GoRoute(
          path: DetailsScreen.routePath,
          builder: (context, state) => const DetailsScreen(),
        ),      
        GoRoute(
          path: FavouritesScreen.routePath,
          builder: (context, state) => const FavouritesScreen(),
        ),
        GoRoute(
          path: MyOrdersScreen.routePath,
          builder: (context, state) => const MyOrdersScreen(),
        ),
        
      ];
  // @override
  // Future<void> preregister() async {
  //   Hive.registerAdapter(UserModelAdapter());
  // }
}
