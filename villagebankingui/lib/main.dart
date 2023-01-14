// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:villagebankingui/auth/auth_page.dart';
import 'package:villagebankingui/auth/main_page.dart';
import 'package:villagebankingui/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
