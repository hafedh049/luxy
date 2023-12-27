import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/helpers/icon.dart';
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
  bool _rememberMe = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
                      onPressed: () => _(() => _obscure = !_obscure),
                      icon: Icon(_obscure ? Bootstrap.eye_slash : Bootstrap.eye, size: 15, color: grey),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: <Widget>[
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return Checkbox(
                      value: _rememberMe,
                      checkColor: white,
                      activeColor: pink,
                      onChanged: (bool? value) => _(() => _rememberMe = !_rememberMe),
                    );
                  },
                ),
                const SizedBox(width: 10),
                const Text("Remember Me", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: const Text("Sign In", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text("Forgot the password?", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            const Row(
              children: <Widget>[
                Divider(thickness: .5, height: .5, color: grey, indent: 25, endIndent: 25),
                Text("OR CONTINUE WITH", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                Divider(thickness: .5, height: .5, color: grey, indent: 25, endIndent: 25),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Iconed(icon: Bootstrap.facebook, callback: () {}),
                Iconed(icon: Bootstrap.google, callback: () {}),
                Iconed(icon: Bootstrap.apple, callback: () {}),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Don't have an account ", style: TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.w500)),
                  Text("Sign up", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
