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
    apiKey: 'AIzaSyAsMI2uS1Zyq98Cs2jhuPRF8Cow0dCOu-I',
    appId: '1:153132340770:web:e816b89e2e914b830fdc7b',
    messagingSenderId: '153132340770',
    projectId: 'bulletinboardolex',
    authDomain: 'bulletinboardolex.firebaseapp.com',
    storageBucket: 'bulletinboardolex.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfOlMaS719hKR2JmqbjWlnna_cDSTnyR0',
    appId: '1:153132340770:android:e1ca013751c82bfa0fdc7b',
    messagingSenderId: '153132340770',
    projectId: 'bulletinboardolex',
    storageBucket: 'bulletinboardolex.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAXISFA8GnhNlbOf-FrF27_pzYMGd5IL4',
    appId: '1:153132340770:ios:8817b91414ff0c4a0fdc7b',
    messagingSenderId: '153132340770',
    projectId: 'bulletinboardolex',
    storageBucket: 'bulletinboardolex.appspot.com',
    iosBundleId: 'com.example.bulletinboard',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAXISFA8GnhNlbOf-FrF27_pzYMGd5IL4',
    appId: '1:153132340770:ios:63e0719668d7c0ca0fdc7b',
    messagingSenderId: '153132340770',
    projectId: 'bulletinboardolex',
    storageBucket: 'bulletinboardolex.appspot.com',
    iosBundleId: 'com.example.bulletinboard.RunnerTests',
  );
}
