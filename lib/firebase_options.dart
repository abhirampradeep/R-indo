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
    apiKey: 'AIzaSyBhyjRSgEVhIG0wyDFnR5AJbRIo4h80Z8o',
    appId: '1:723872629457:web:e3e3918b441be435733bf0',
    messagingSenderId: '723872629457',
    projectId: 'rindo-b15b9',
    authDomain: 'rindo-b15b9.firebaseapp.com',
    storageBucket: 'rindo-b15b9.appspot.com',
    measurementId: 'G-Y0MKTGT5K6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwSKXSe9lKyEwdthR2-zgF8zgRVuSLLNg',
    appId: '1:723872629457:android:495b11e39ae4e3e3733bf0',
    messagingSenderId: '723872629457',
    projectId: 'rindo-b15b9',
    storageBucket: 'rindo-b15b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIzVqTjMyd82uAksmx8-C1WriXzXSr1FA',
    appId: '1:723872629457:ios:4eaf1e10351de500733bf0',
    messagingSenderId: '723872629457',
    projectId: 'rindo-b15b9',
    storageBucket: 'rindo-b15b9.appspot.com',
    iosClientId: '723872629457-em85l74gdripco8tvik671cj3ci9qdaf.apps.googleusercontent.com',
    iosBundleId: 'com.example.arIndoorNav',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIzVqTjMyd82uAksmx8-C1WriXzXSr1FA',
    appId: '1:723872629457:ios:4eaf1e10351de500733bf0',
    messagingSenderId: '723872629457',
    projectId: 'rindo-b15b9',
    storageBucket: 'rindo-b15b9.appspot.com',
    iosClientId: '723872629457-em85l74gdripco8tvik671cj3ci9qdaf.apps.googleusercontent.com',
    iosBundleId: 'com.example.arIndoorNav',
  );
}