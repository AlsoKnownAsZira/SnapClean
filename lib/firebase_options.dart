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
    apiKey: 'AIzaSyAbQsbM9cpX5j20KaoxaiJNHxqOCZ80FK0',
    appId: '1:941468134263:web:9641822d1244af15590f72',
    messagingSenderId: '941468134263',
    projectId: 'snapclean-fddf8',
    authDomain: 'snapclean-fddf8.firebaseapp.com',
    storageBucket: 'snapclean-fddf8.appspot.com',
    measurementId: 'G-BH351811G3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAieX_AUJTsABmq8wORU9Q7Otc2Q1JvlKk',
    appId: '1:941468134263:android:31575fe6c6e2b074590f72',
    messagingSenderId: '941468134263',
    projectId: 'snapclean-fddf8',
    storageBucket: 'snapclean-fddf8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChaVUqjEsSrcfUPXhVmNUNyu4mszfNY_A',
    appId: '1:941468134263:ios:c89be0a56ab41bb3590f72',
    messagingSenderId: '941468134263',
    projectId: 'snapclean-fddf8',
    storageBucket: 'snapclean-fddf8.appspot.com',
    iosClientId: '941468134263-037dmfbdhpblkn9lrcrpfjajpudv5ma9.apps.googleusercontent.com',
    iosBundleId: 'com.theunity.snapclean',
  );
}
