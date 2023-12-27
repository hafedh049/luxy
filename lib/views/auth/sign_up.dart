import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/helpers/button.dart';
import 'package:luxy/views/auth/address.dart';

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

  int _gender = -1;
  bool _genderMenu = false;
  File? profilePicture;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: dark,
          leading: IconButton(
            icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Fill your profile", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return GestureDetector(
                    onTap: () {},
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: pink, width: 2),
                            image: profilePicture == null ? null : DecorationImage(image: AssetImage(profilePicture!.path), fit: BoxFit.cover),
                          ),
                          child: profilePicture != null ? null : const Icon(Bootstrap.people, size: 35, color: pink),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: grey.withOpacity(.3)),
                          child: const Icon(Bootstrap.pen, size: 15, color: white),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                child: TextField(
                  style: const TextStyle(color: grey),
                  controller: _usernameController,
                  decoration: const InputDecoration(contentPadding: EdgeInsets.all(16), border: InputBorder.none, hintText: "Username", hintStyle: TextStyle(color: grey)),
                ),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                child: TextField(
                  style: const TextStyle(color: grey),
                  controller: _emailController,
                  decoration: const InputDecoration(contentPadding: EdgeInsets.all(16), border: InputBorder.none, hintText: "E-mail", hintStyle: TextStyle(color: grey)),
                ),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                child: TextField(
                  controller: _birthDateController,
                  style: const TextStyle(color: grey),
                  readOnly: true,
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
                      icon: const Icon(Bootstrap.calendar, size: 15, color: grey),
                    ),
                  ),
                ),
              ),
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return AnimatedContainer(
                    duration: 500.ms,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          readOnly: true,
                          style: const TextStyle(color: grey),
                          controller: _genderController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16),
                            border: InputBorder.none,
                            hintText: "Gender",
                            hintStyle: const TextStyle(color: grey),
                            prefixIcon: _gender == -1 ? null : Icon(_gender == 0 ? Bootstrap.gender_male : Bootstrap.gender_female, size: 15, color: grey),
                            suffixIcon: IconButton(
                              onPressed: () => _(() => _genderMenu = !_genderMenu),
                              icon: Icon(_genderMenu ? FontAwesome.chevron_left_solid : FontAwesome.chevron_down_solid, size: 15, color: grey),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _genderMenu,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Buttoned(
                                  text: "Male",
                                  icon: Bootstrap.gender_male,
                                  callback: () {
                                    _(
                                      () {
                                        _gender = 0;
                                        _genderController.text = "Male";
                                        _genderMenu = false;
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Buttoned(
                                  text: "Female",
                                  icon: Bootstrap.gender_female,
                                  callback: () {
                                    _(
                                      () {
                                        _gender = 1;
                                        _genderController.text = "Female";
                                        _genderMenu = false;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Address()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: const Text("Continue", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
