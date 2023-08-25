import 'package:branding/features/product/presentation/screens/home_screen.dart';
import 'package:branding/features/product/presentation/screens/suppliers_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../auth/presentation/controllers/auth_controller.dart';
import '../auth/presentation/screens/screens.dart';
import '../auth/presentation/state/state.dart';

class SupplierFeature extends Feature {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: HomeScreen.routePath,
          builder: (context, state) => const HomeScreen(),
          redirect: (context, state) {
            final ref = ProviderScope.containerOf(context);
            final authState = ref.read(authStateProvider);
            if (authState is! Authenticated) {
              return LoginScreen.routePath;
            }
            return null;
          },
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
