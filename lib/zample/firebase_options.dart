// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// 
/// 
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBdTku3RszSsheHZ5Ip-IWjWEb1xLr_-Wo',
    appId: '1:113187004448:web:559bc78f0fd0e65a511c45',
    messagingSenderId: '113187004448',
    projectId: 'branding-1491f',
    authDomain: 'branding-1491f.firebaseapp.com',
    storageBucket: 'branding-1491f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEguTlEsqxSbWtRaQbBZCVRqWbxAprXtQ',
    appId: '1:113187004448:android:e592d01873f55565511c45',
    messagingSenderId: '113187004448',
    projectId: 'branding-1491f',
    storageBucket: 'branding-1491f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXsf9P0eDSQ31F115PN5n6BvKYqzqdfaE',
    appId: '1:113187004448:ios:60893619f3b38f56511c45',
    messagingSenderId: '113187004448',
    projectId: 'branding-1491f',
    storageBucket: 'branding-1491f.appspot.com',
    iosClientId: '113187004448-u4qk45vkokv12qnjgnn5qf658tdsq0nl.apps.googleusercontent.com',
    iosBundleId: 'com.example.branding',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXsf9P0eDSQ31F115PN5n6BvKYqzqdfaE',
    appId: '1:113187004448:ios:fe97f7aeeb07b90f511c45',
    messagingSenderId: '113187004448',
    projectId: 'branding-1491f',
    storageBucket: 'branding-1491f.appspot.com',
    iosClientId: '113187004448-l5pacgc6ls86h2pnrb069aon6hchjvr0.apps.googleusercontent.com',
    iosBundleId: 'com.example.branding.RunnerTests',
  );
}