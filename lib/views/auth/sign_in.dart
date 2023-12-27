import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/helpers/icon.dart';
import 'package:luxy/utils/helpers/layvy.dart';
import 'package:luxy/views/auth/forget_password_method.dart';
import 'package:luxy/views/auth/sign_up.dart';
import 'package:luxy/views/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Layvy(fontSize: 64),
              const Text("Login to your account", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500)),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                    hintText: "E-mail",
                    hintStyle: TextStyle(color: grey),
                    prefixIcon: Icon(Bootstrap.envelope, size: 15, color: grey),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                child: StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return TextField(
                      controller: _passwordController,
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: const TextStyle(color: grey),
                        prefixIcon: const Icon(Bootstrap.lock_fill, size: 15, color: grey),
                        suffixIcon: IconButton(
                          onPressed: () => _(() => _obscure = !_obscure),
                          icon: Icon(_obscure ? Bootstrap.eye_slash : Bootstrap.eye, size: 15, color: grey),
                        ),
                      ),
                    );
                  },
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
                  const Text("Remember Me", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const Home()), (Route route) => route.isFirst);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: const Text("Sign In", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgetPasswordMethods())),
                child: const Text("Forgot the password?", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
              const Row(
                children: <Widget>[
                  Expanded(child: Divider(thickness: .5, height: .5, color: grey, endIndent: 5)),
                  Text("OR CONTINUE WITH", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                  Expanded(child: Divider(thickness: .5, height: .5, color: grey, indent: 5)),
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
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SignUp())),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Don't have an account ", style: TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.w500)),
                    Text("Sign up", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
