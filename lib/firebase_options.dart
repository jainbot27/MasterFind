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
    apiKey: 'AIzaSyDPsIw9a0xw8BiDMjkgE7GPG7kFEmRC8e8',
    appId: '1:125934471567:web:6b9c817ef00ebc8c4f23fa',
    messagingSenderId: '125934471567',
    projectId: 'projectendofyear-342c2',
    authDomain: 'projectendofyear-342c2.firebaseapp.com',
    storageBucket: 'projectendofyear-342c2.appspot.com',
    measurementId: 'G-MF9TN0ECVG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqsGddeId-XScG_s8WNebTXcZhHsLphWU',
    appId: '1:125934471567:android:ef7259b54a897d8f4f23fa',
    messagingSenderId: '125934471567',
    projectId: 'projectendofyear-342c2',
    storageBucket: 'projectendofyear-342c2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIACrG7VyvYR3j0FVwp0pGHWcbsGUUfJw',
    appId: '1:125934471567:ios:822b32f343f637d04f23fa',
    messagingSenderId: '125934471567',
    projectId: 'projectendofyear-342c2',
    storageBucket: 'projectendofyear-342c2.appspot.com',
    iosClientId: '125934471567-mahb3bgq4jt9c6clvmqke2f919tbn2ud.apps.googleusercontent.com',
    iosBundleId: 'com.example.name',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIACrG7VyvYR3j0FVwp0pGHWcbsGUUfJw',
    appId: '1:125934471567:ios:822b32f343f637d04f23fa',
    messagingSenderId: '125934471567',
    projectId: 'projectendofyear-342c2',
    storageBucket: 'projectendofyear-342c2.appspot.com',
    iosClientId: '125934471567-mahb3bgq4jt9c6clvmqke2f919tbn2ud.apps.googleusercontent.com',
    iosBundleId: 'com.example.name',
  );
}
