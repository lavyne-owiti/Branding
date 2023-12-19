import 'package:branding/features/suppliers/presentation/screens/add_product.dart';
import 'package:branding/features/suppliers/presentation/screens/all_added_products_screen.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import 'presentation/screens/suppliers_screen.dart';

class SuppliersFeature extends Feature {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: SuppliersScreen.routePath,
          builder: (context, state) => const SuppliersScreen(),
        ),
         GoRoute(
          path: AddProductScreen.routePath,
          builder: (context, state) => const AddProductScreen(),
        ),
          GoRoute(
          path: AllAddedProducts.routePath,
          builder: (context, state) => const AllAddedProducts(),
        ),
        
      ];
  // @override
  // Future<void> preregister() async {
  //   Hive.registerAdapter(UserModelAdapter());
  // }
}
