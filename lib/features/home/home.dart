import 'package:branding/features/home/presentation/screens/about_screen.dart';
import 'package:branding/features/home/presentation/screens/home_screen.dart';
import 'package:branding/features/home/presentation/screens/user_account_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../auth/presentation/controllers/auth_controller.dart';
import '../auth/presentation/screens/login_screen.dart';
import '../auth/presentation/state/auth_state.dart';

class HomeFeature extends Feature {
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
          path: UserAccountScreen.routePath,
          builder: (context, state) => const UserAccountScreen(),
        ),
           GoRoute(
          path: AboutScreen.routePath,
          builder: (context, state) => const AboutScreen(),
        ),
      ];
  // @override
  // Future<void> preregister() async {
  //   Hive.registerAdapter(UserModelAdapter());
  // }
}
