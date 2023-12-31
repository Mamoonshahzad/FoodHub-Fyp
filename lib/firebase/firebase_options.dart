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
    apiKey: 'AIzaSyAagxUktA6F7bodweeIWz5ihj9h6OMKrOc',
    appId: '1:851016060797:web:39a7c7a84dae537f6f0614',
    messagingSenderId: '851016060797',
    projectId: 'foodhub-dd8c1',
    authDomain: 'foodhub-dd8c1.firebaseapp.com',
    storageBucket: 'foodhub-dd8c1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZphdbmmRlURQ_-hqVJFiWewlEKBKjIb8',
    appId: '1:851016060797:android:a6aa0c91dfa38e876f0614',
    messagingSenderId: '851016060797',
    projectId: 'foodhub-dd8c1',
    storageBucket: 'foodhub-dd8c1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbB9b3Y_qaonOMpMRWqjx7LZ8HrYBeTj4',
    appId: '1:851016060797:ios:a69c3b0840827ff56f0614',
    messagingSenderId: '851016060797',
    projectId: 'foodhub-dd8c1',
    storageBucket: 'foodhub-dd8c1.appspot.com',
    iosClientId: '851016060797-ef7gic1g52i276l7sopagnu9t6urgek5.apps.googleusercontent.com',
    iosBundleId: 'com.example.projecthomepage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbB9b3Y_qaonOMpMRWqjx7LZ8HrYBeTj4',
    appId: '1:851016060797:ios:a69c3b0840827ff56f0614',
    messagingSenderId: '851016060797',
    projectId: 'foodhub-dd8c1',
    storageBucket: 'foodhub-dd8c1.appspot.com',
    iosClientId: '851016060797-ef7gic1g52i276l7sopagnu9t6urgek5.apps.googleusercontent.com',
    iosBundleId: 'com.example.projecthomepage',
  );
}
