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
    apiKey: 'AIzaSyDno9xxXuaT_kAuGCMVAl1hV_Qyn_FnGfw',
    appId: '1:494861180035:web:7bb7e2a31e445e45bc8fb6',
    messagingSenderId: '494861180035',
    projectId: 'hotshop-d738d',
    authDomain: 'hotshop-d738d.firebaseapp.com',
    databaseURL: 'https://hotshop-d738d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'hotshop-d738d.appspot.com',
    measurementId: 'G-ZQGV1WH07K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCurJwBQ0KzU1kY1osgtrM2RCChXCI6SIY',
    appId: '1:494861180035:android:ecae896c647b1873bc8fb6',
    messagingSenderId: '494861180035',
    projectId: 'hotshop-d738d',
    databaseURL: 'https://hotshop-d738d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'hotshop-d738d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPYfjypF4yZeO8dfNYUTFeu9aU9tMJ5C0',
    appId: '1:494861180035:ios:4066b3f9cbac3930bc8fb6',
    messagingSenderId: '494861180035',
    projectId: 'hotshop-d738d',
    databaseURL: 'https://hotshop-d738d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'hotshop-d738d.appspot.com',
    iosBundleId: 'nematov.dev.hotShop',
  );
}