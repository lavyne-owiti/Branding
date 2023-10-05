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
      ];
  // @override
  // Future<void> preregister() async {
  //   Hive.registerAdapter(UserModelAdapter());
  // }
}
