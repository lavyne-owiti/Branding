import 'package:branding/features/auth/presentation/screens/splash_screen.dart';
import 'package:branding/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final parentNavigatorKey = GlobalKey<NavigatorState>();
final initialRoute = SplashScreen.routePath;

final router = GoRouter(
  navigatorKey: parentNavigatorKey,
  initialLocation: initialRoute,
  routes: features.routes,
  debugLogDiagnostics: true,
);

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  // ref.watch(authStateProvider);
  return router;
});
