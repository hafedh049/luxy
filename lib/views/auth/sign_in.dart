import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/helpers/layvy.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Layvy(),
          const Text("Login to your account", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500)),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(16),
              border: InputBorder.none,
              hintText: "E-mail",
              prefixIcon: Icon(Bootstrap.envelope, size: 15, color: grey),
            ),
          ),
          TextField(
            controller: _emailController,
            obscureText: !_obscure,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              border: InputBorder.none,
              hintText: "Password",
              prefixIcon: const Icon(Bootstrap.lock_fill, size: 15, color: grey),
              suffixIcon: StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return IconButton(
                    onPressed: () {},
                    icon: const Icon(Bootstrap.lock_fill, size: 15, color: grey),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
