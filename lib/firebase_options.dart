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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB9QJgCZkRseZgvb7pdM9iYu9SRJV0zdZk',
    appId: '1:98841967258:web:9d45197489d2476e997d23',
    messagingSenderId: '98841967258',
    projectId: 'mobile-d4f94',
    authDomain: 'mobile-d4f94.firebaseapp.com',
    storageBucket: 'mobile-d4f94.appspot.com',
    measurementId: 'G-SLBZFGLKZV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_y0wMAZy2k8aguMq8hdxffOmI-sHLtvg',
    appId: '1:98841967258:android:f1f9c52c12cba429997d23',
    messagingSenderId: '98841967258',
    projectId: 'mobile-d4f94',
    storageBucket: 'mobile-d4f94.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaNCoVPs7AqYLbxlp8F7g1PMHpzyQUAvI',
    appId: '1:98841967258:ios:d9eb8c9998b226fa997d23',
    messagingSenderId: '98841967258',
    projectId: 'mobile-d4f94',
    storageBucket: 'mobile-d4f94.appspot.com',
    iosBundleId: 'com.example.mobilepro',
  );
}