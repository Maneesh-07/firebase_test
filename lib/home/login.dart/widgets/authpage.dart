import 'package:firebase_test/home/login.dart/login.dart';
import 'package:firebase_test/home/register.dart/register.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? SignIn(onClickedSignUp: toggle)
        : RegisterScreen(
            onClickedSignIn: toggle,
          );
  }

  void toggle() => setState(() => isLogin = !isLogin);
}
