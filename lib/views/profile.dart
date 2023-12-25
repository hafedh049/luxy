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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Profile", style: TextStyle(color: white, fontSize: 18, letterSpacing: 2, fontWeight: FontWeight.w500)),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              CircleAvatar(radius: 15, backgroundImage: AssetImage("assets/pictures/me.jpeg")),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Hafedh Guenichi", style: TextStyle(color: white, fontSize: 18, letterSpacing: 2, fontWeight: FontWeight.w500)),
                  Text("Following 23", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
        const Text("Settings", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
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
          child: Row(
            children: <Widget>[
              const Icon(FontAwesome.eye, size: 15, color: white),
              const SizedBox(width: 20),
              const Text("Dark Mode", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
              const Spacer(),
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) setS) {
                  return Switch(
                    value: user!.get("dark_mode"),
                    onChanged: (bool value) => user!.put("dark_mode", !user!.get("dark_mode")),
                    activeColor: pink,
                    inactiveThumbColor: white,
                    inactiveTrackColor: white,
                  );
                },
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(FontAwesome.shield_solid, size: 15, color: white),
              SizedBox(width: 20),
              Text("Security", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
        const Text("Orders", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(FontAwesome.cart_shopping_solid, size: 15, color: white),
              SizedBox(width: 20),
              Text("Manage my orders", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
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
              Text("Order history", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(FontAwesome.location_arrow_solid, size: 15, color: white),
              SizedBox(width: 20),
              Text("Manage shipping address", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
        const Text("Services", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(FontAwesome.lock_solid, size: 15, color: white),
              SizedBox(width: 20),
              Text("Privacy policy", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(FontAwesome.info_solid, size: 15, color: white),
              SizedBox(width: 20),
              Text("Help Center", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(FontAwesome.users_solid, size: 15, color: white),
              SizedBox(width: 20),
              Text("Invite friends", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
      ],
    );
  }
}
