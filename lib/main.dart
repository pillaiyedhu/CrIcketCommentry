import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sept15_crickbuzz_developer/Services/static_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sept15_crickbuzz_developer/screens/home_page.dart';
import 'package:sept15_crickbuzz_developer/screens/tv_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
    create: (context) => FirebaseServiceProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(backgroundColor: Colors.grey.shade100),
    );
  }
}
