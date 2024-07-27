// firebase_options.dart

import 'package:firebase_core/firebase_core.dart';

// Replace with your own values
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // Add your configuration options here
    return FirebaseOptions(
      apiKey: "AIzaSyBo48Am6vdPRIgJq88y4zx3EN5aWEQXNQs",
      appId: "1:75127603996:android:781154c8d1661990bdb0d9",
      messagingSenderId: "75127603996",
      projectId: "shopping-61142",
      storageBucket: "shopping-61142.appspot.com",
      databaseURL: "https://shopping-61142-default-rtdb.firebaseio.com",
      // Add other options as needed
    );
  }
}

