import 'package:flutter/material.dart';
import 'package:villagebankingui/pages/login.dart';

import '../pages/register_page.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        showRegistrationPage: toggleScreens,
      );
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
