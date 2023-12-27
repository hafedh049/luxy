import 'package:flutter/material.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/helpers/layvy.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Layvy(),
          Text("Login to your account", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
