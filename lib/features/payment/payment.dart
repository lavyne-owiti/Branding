import 'package:branding/features/payment/presentation/screens/payments_screen.dart';
import 'package:branding/features/payment/presentation/screens/success_screen.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import 'presentation/screens/messages_screen.dart';

class PaymentsFeature extends Feature {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: PaymentsScreen.routePath,
          builder: (context, state) => const PaymentsScreen(),
        ),
         GoRoute(
          path: MessagesScreen.routePath,
          builder: (context, state) => const MessagesScreen(),
        ),
          GoRoute(
          path: SuccessScreen.routePath,
          builder: (context, state) => const SuccessScreen(),
        ),
        
      ];
  // @override
  // Future<void> preregister() async {
  //   Hive.registerAdapter(UserModelAdapter());
  // }
}