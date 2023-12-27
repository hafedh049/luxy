import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  final TextEditingController _birthDateController = TextEditingController(text: DateTime.now().toString().split(" ")[0]);
  final TextEditingController _genderController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  File? profilePicture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: Iconed(icon: FontAwesome.chevron_left_solid, callback: () {}),
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
                  hintText: "Username",
                  hintStyle: TextStyle(color: grey),
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
                  hintText: "E-mail",
                  hintStyle: TextStyle(color: grey),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.4)),
              child: TextField(
                controller: _birthDateController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  border: InputBorder.none,
                  hintText: "Date of birth",
                  hintStyle: const TextStyle(color: grey),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        currentDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        confirmText: "PICK",
                        cancelText: "LEAVE",
                        helpText: "Choose your birthdate",
                      ).then(
                        (DateTime? value) {
                          if (value != null) {
                            _birthDateController.text = value.toString().split(" ")[0];
                          }
                        },
                      );
                    },
                    icon: const Icon(Bootstrap.chevron_compact_down, size: 15, color: grey),
                  ),
                ),
              ),
            ),
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return AnimatedContainer(
                  duration: 500.ms,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.4)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        readOnly: true,
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          border: InputBorder.none,
                          hintText: "Gender",
                          hintStyle: const TextStyle(color: grey),
                          prefixIcon: Icon(Bootstrap.envelope, size: 15, color: grey),
                          suffixIcon: IconButton(
                            onPressed: () => _(() {}),
                            icon: const Icon(Bootstrap.chevron_compact_down, size: 15, color: grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
