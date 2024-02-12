import 'package:flutter/material.dart';
import 'package:polylavery/login/signIn.dart';
import 'package:polylavery/screen/accueil.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //  options: DefaultFirebaseOptions.currentPlatform,
      // options: const FirebaseOptions(
      //     apiKey: '',
      //     appId: '1:123044865391:android:170e1d945e29e0fcad349a',
      //     messagingSenderId: '123044865391',
      //     projectId: 'polylavery-51138')

      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'JEP - PolyLavery',
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
