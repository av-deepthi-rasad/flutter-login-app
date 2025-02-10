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
    apiKey: 'AIzaSyDlV7px8sxOBb918qYDvoH8zEIAVyNTviY',
    appId: '1:610138972310:web:3b4386417025711633e2b7',
    messagingSenderId: '610138972310',
    projectId: 'login-app-e1139',
    authDomain: 'login-app-e1139.firebaseapp.com',
    storageBucket: 'login-app-e1139.firebasestorage.app',
    measurementId: 'G-GPKLJP2YGJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAEyL8chWyUoagKLEpYwQX9d5lKUPvv7Gw',
    appId: '1:610138972310:android:73864836e5cc89a933e2b7',
    messagingSenderId: '610138972310',
    projectId: 'login-app-e1139',
    storageBucket: 'login-app-e1139.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWNfl31r_GMEa5-T-zQQvaOIGUnTasshU',
    appId: '1:610138972310:ios:9c49d9b878d5537e33e2b7',
    messagingSenderId: '610138972310',
    projectId: 'login-app-e1139',
    storageBucket: 'login-app-e1139.firebasestorage.app',
    iosBundleId: 'com.example.loginApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWNfl31r_GMEa5-T-zQQvaOIGUnTasshU',
    appId: '1:610138972310:ios:9c49d9b878d5537e33e2b7',
    messagingSenderId: '610138972310',
    projectId: 'login-app-e1139',
    storageBucket: 'login-app-e1139.firebasestorage.app',
    iosBundleId: 'com.example.loginApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDlV7px8sxOBb918qYDvoH8zEIAVyNTviY',
    appId: '1:610138972310:web:2040566f481f643933e2b7',
    messagingSenderId: '610138972310',
    projectId: 'login-app-e1139',
    authDomain: 'login-app-e1139.firebaseapp.com',
    storageBucket: 'login-app-e1139.firebasestorage.app',
    measurementId: 'G-FJTYTDP108',
  );
}
