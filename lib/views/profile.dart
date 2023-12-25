import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        centerTitle: true,
        title: const Text("Profile", style: TextStyle(color: white, fontSize: 18, letterSpacing: 2, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
