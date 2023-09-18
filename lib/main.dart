import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/provider/TeamProvider.dart';
import 'package:sept15_crickbuzz_developer/screens/BattingPage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAyNfzAEqrAeIXbTKsIs8Hw2xdTRV435vs",
      authDomain: "criccom-2ad92.firebaseapp.com",
      projectId: "criccom-2ad92",
      storageBucket: "criccom-2ad92.appspot.com",
      messagingSenderId: "453593139291",
      appId: "1:453593139291:web:b8a74f3c2e853eabc1977e",
      measurementId: "G-57K08V4BXV"
    )
  );

  runApp(
    ChangeNotifierProvider(create: (context) => TeamProvider(),child: MyApp(),)

  );
  
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: BattingPage());
  }
}
