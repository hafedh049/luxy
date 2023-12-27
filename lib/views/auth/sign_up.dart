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
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                StatefulBuilder(builder: (context, snapshot) {
                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: pink),
                      image: profilePicture == null ? null : DecorationImage(image: AssetImage(profilePicture!.path), fit: BoxFit.cover),
                    ),
                    child: profilePicture == null ? null : const Icon(Bootstrap.people, size: 25, color: pink),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
