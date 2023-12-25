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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: <Widget>[
                  CircleAvatar(radius: 15, backgroundImage: AssetImage("assets/me.png")),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Hafedh Guenichi", style: TextStyle(color: white, fontSize: 18, letterSpacing: 2, fontWeight: FontWeight.w500)),
                      Text("Following 23", style: TextStyle(color: grey, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            const Text("Settings", style: TextStyle(color: grey, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: <Widget>[
                  Icon(FontAwesome.user, size: 15, color: white),
                  SizedBox(width: 20),
                  Text("Edit Profile", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: <Widget>[
                  Icon(FontAwesome.bell, size: 15, color: white),
                  SizedBox(width: 20),
                  Text("Notification", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: <Widget>[
                  Icon(Bootstrap.translate, size: 15, color: white),
                  SizedBox(width: 20),
                  Text("Language", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Text("English (US)", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
                  SizedBox(width: 20),
                  Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: <Widget>[
                  Icon(FontAwesome.eye, size: 15, color: white),
                  SizedBox(width: 20),
                  Text("Dark Mode", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
                  Spacer(),
                  StatefulBuilder(
                      stream: null,
                      builder: (context, snapshot) {
                        return Switch(value: value, onChanged: onChanged);
                      }),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: <Widget>[
                  Icon(FontAwesome.user, size: 15, color: white),
                  SizedBox(width: 20),
                  Text("Edit Profile", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
