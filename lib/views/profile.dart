import 'package:flutter/material.dart';
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
      body: GestureDetector(
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
            )
          ],
        ),
      ),
    );
  }
}
