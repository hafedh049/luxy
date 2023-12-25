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
    return AppBar(
      backgroundColor: dark,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: pink),
      ),
    );
  }
}
