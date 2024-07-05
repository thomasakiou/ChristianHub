import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCdxxxzoMG17QVn7aNYvX70asQf0vRzrR4",
            authDomain: "christianhub-10333.firebaseapp.com",
            projectId: "christianhub-10333",
            storageBucket: "christianhub-10333.appspot.com",
            messagingSenderId: "995457321959",
            appId: "1:995457321959:web:1336abba12538aa26e0b42"));
  } else {
    await Firebase.initializeApp();
  }
}
