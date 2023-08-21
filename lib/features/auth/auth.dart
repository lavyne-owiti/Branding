import 'package:branding/features/auth/presentation/screens/forget_password.dart';
import 'package:branding/features/auth/presentation/screens/onboarding_screens.dart';
import 'package:branding/features/auth/presentation/screens/singup_screen.dart';
import 'package:branding/features/auth/presentation/screens/splash_screen.dart';
import 'package:branding/features/auth/presentation/screens/welcome_screen.dart';
import 'package:branding/features/features.dart';
import 'package:go_router/go_router.dart';

import 'presentation/screens/login_screen.dart';

class AuthFeature extends Feature {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: SplashScreen.routePath,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: OnBoardingScreen.routePath,
          builder: (context, state) => const OnBoardingScreen(),
        ),
        GoRoute(
          path: LoginScreen.routePath,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: WelcomeScreen.routePath,
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: SignUpScreen.routePath,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: ForgotPasswordScreen.routePath,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
      ];
  // @override
  // Future<void> preregister() async {
  //   Hive.registerAdapter(UserModelAdapter());
  // }
}
