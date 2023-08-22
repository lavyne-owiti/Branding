
import 'package:branding/features/supplier/presentation/screens/home_screen.dart';
import 'package:branding/features/supplier/presentation/screens/suppliers_screen.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';

class SupplierFeature extends Feature {
  @override
  List<GoRoute> get routes => [

        GoRoute(
          path: HomeScreen.routePath,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: SuppliersScreen.routePath,
          builder: (context, state) => const SuppliersScreen(),
        ),
      
      ];
  // @override
  // Future<void> preregister() async {
  //   Hive.registerAdapter(UserModelAdapter());
  // }
}