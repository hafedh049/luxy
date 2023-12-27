import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/helpers/icon.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
   @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  File? profilePicture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: Iconed(icon: Bootstrap.chevron_compact_left, callback: () {}),
        title: const Text("Fill your profile", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: pink),
                        image: profilePicture == null ? null : DecorationImage(image: AssetImage(profilePicture!.path), fit: BoxFit.cover),
                      ),
                      child: profilePicture == null ? null : const Icon(Bootstrap.people, size: 25, color: pink),
                    ),
                    IconButton(
                      iconSize: 10,
                      color: pink,
                      onPressed: () {},
                      icon: const Icon(Bootstrap.pencil),
                    ),
                  ],
                );
              },
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.4)),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                  hintText: "Username",                  hintStyle: TextStyle(color: grey),
                  prefixIcon: Icon(Bootstrap.envelope, size: 15, color: grey),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.4)),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                  hintText: "E-mail",                  hintStyle: TextStyle(color: grey),
                  prefixIcon: Icon(Bootstrap.envelope, size: 15, color: grey),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.4)),
              child:
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.4)),
              child:
            ),
          ],
        ),
      ),
    );
  }
}
