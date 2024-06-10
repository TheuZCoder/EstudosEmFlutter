import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_firebase/firebase_options.dart';
import 'package:projeto_firebase/view/home.dart';
import 'package:projeto_firebase/view/login.dart';
import 'package:projeto_firebase/view/registar.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context)=> const HomeScreen(),
        '/login':(context) => const LoginScreen(),
        '/register':(context) => const RegisterScreen(),
      },
    );
  }
}
