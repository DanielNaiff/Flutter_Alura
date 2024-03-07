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
    apiKey: 'AIzaSyDIqgF-K5xIJUntzPOt7PLsHk7E-rXWKeU',
    appId: '1:807200836966:web:0bf68bfa130bc9ff1a0ca7',
    messagingSenderId: '807200836966',
    projectId: 'flutter-firebase-firesto-b0be4',
    authDomain: 'flutter-firebase-firesto-b0be4.firebaseapp.com',
    databaseURL: 'https://flutter-firebase-firesto-b0be4-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-firebase-firesto-b0be4.appspot.com',
    measurementId: 'G-Y2K7V14EV7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9vwc31mS1-YxSuOWOsIrnP73aMNeDnbc',
    appId: '1:807200836966:android:4b20c63b6cb0b60e1a0ca7',
    messagingSenderId: '807200836966',
    projectId: 'flutter-firebase-firesto-b0be4',
    databaseURL: 'https://flutter-firebase-firesto-b0be4-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-firebase-firesto-b0be4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSRBrFP0CZFu--cQ8Pv4C_dtXdHvIPHSg',
    appId: '1:807200836966:ios:4a14b03a43e343001a0ca7',
    messagingSenderId: '807200836966',
    projectId: 'flutter-firebase-firesto-b0be4',
    databaseURL: 'https://flutter-firebase-firesto-b0be4-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-firebase-firesto-b0be4.appspot.com',
    iosBundleId: 'com.example.firebase',
  );
}
