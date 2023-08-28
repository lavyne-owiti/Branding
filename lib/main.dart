import 'package:branding/app.dart';
import 'package:branding/config/logger.dart';
import 'package:branding/core/core.dart';
import 'package:branding/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/features.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await features.preregister();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const App(),
    ),
  );
}
