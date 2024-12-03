// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
/// ```
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
        return windows;
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
    apiKey: 'AIzaSyAzBi9bhECa1mOB0Ef6LKyKwy1rcPhpDOI',
    appId: '1:138365326747:web:08aed29fc2f38e9c057d3e',
    messagingSenderId: '138365326747',
    projectId: 'ecommerce-w',
    authDomain: 'ecommerce-w.firebaseapp.com',
    storageBucket: 'ecommerce-w.firebasestorage.app',
    measurementId: 'G-0QPPF6ZT0L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWS0cVyuOPWBqj8W7SwdQUvQ96Pa8Twfw',
    appId: '1:138365326747:android:be7792c76250339a057d3e',
    messagingSenderId: '138365326747',
    projectId: 'ecommerce-w',
    storageBucket: 'ecommerce-w.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDE0FgV3kMzTyLwaVC1KgAOaeMnQTIDTYs',
    appId: '1:138365326747:ios:02e9c5870c7c3956057d3e',
    messagingSenderId: '138365326747',
    projectId: 'ecommerce-w',
    storageBucket: 'ecommerce-w.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceAppw',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDE0FgV3kMzTyLwaVC1KgAOaeMnQTIDTYs',
    appId: '1:138365326747:ios:02e9c5870c7c3956057d3e',
    messagingSenderId: '138365326747',
    projectId: 'ecommerce-w',
    storageBucket: 'ecommerce-w.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceAppw',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAzBi9bhECa1mOB0Ef6LKyKwy1rcPhpDOI',
    appId: '1:138365326747:web:bb3f23d8d56451e7057d3e',
    messagingSenderId: '138365326747',
    projectId: 'ecommerce-w',
    authDomain: 'ecommerce-w.firebaseapp.com',
    storageBucket: 'ecommerce-w.firebasestorage.app',
    measurementId: 'G-WXHWRTP71K',
  );
}
