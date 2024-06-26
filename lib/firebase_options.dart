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
    apiKey: 'AIzaSyCT4CrKQtV4jd0VHxBHbIoyL_-h-I-PX_c',
    appId: '1:676376055999:web:222c15eab27aba45e0360a',
    messagingSenderId: '676376055999',
    projectId: 'aid-humanity-2221d',
    authDomain: 'aid-humanity-2221d.firebaseapp.com',
    databaseURL: 'https://aid-humanity-2221d-default-rtdb.firebaseio.com',
    storageBucket: 'aid-humanity-2221d.appspot.com',
    measurementId: 'G-DZXQ93D9N2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8Q5sjR4KOFvAGRoEdZeBg1mu_u8BoeNI',
    appId: '1:676376055999:android:35e7107a2769c6abe0360a',
    messagingSenderId: '676376055999',
    projectId: 'aid-humanity-2221d',
    databaseURL: 'https://aid-humanity-2221d-default-rtdb.firebaseio.com',
    storageBucket: 'aid-humanity-2221d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAExfKKkMXXE_YkJFVqmcX36dlkV4gZBM',
    appId: '1:676376055999:ios:f3bd979f2855b47ae0360a',
    messagingSenderId: '676376055999',
    projectId: 'aid-humanity-2221d',
    databaseURL: 'https://aid-humanity-2221d-default-rtdb.firebaseio.com',
    storageBucket: 'aid-humanity-2221d.appspot.com',
    androidClientId: '676376055999-hsls83g0q5vjengfkrh2fb7jid6cf34i.apps.googleusercontent.com',
    iosClientId: '676376055999-m4aquk6livl9tn4bh20c2c5h11cqsp0i.apps.googleusercontent.com',
    iosBundleId: 'com.example.aidRepository',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAExfKKkMXXE_YkJFVqmcX36dlkV4gZBM',
    appId: '1:676376055999:ios:e7e849dbdda75eeae0360a',
    messagingSenderId: '676376055999',
    projectId: 'aid-humanity-2221d',
    databaseURL: 'https://aid-humanity-2221d-default-rtdb.firebaseio.com',
    storageBucket: 'aid-humanity-2221d.appspot.com',
    androidClientId: '676376055999-hsls83g0q5vjengfkrh2fb7jid6cf34i.apps.googleusercontent.com',
    iosClientId: '676376055999-07mss352j7ijm7c2runlr86l7h27hd7g.apps.googleusercontent.com',
    iosBundleId: 'com.example.aidRepository.RunnerTests',
  );
}
