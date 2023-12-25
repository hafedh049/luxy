import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
        const SizedBox(height: 20),
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Text("Profile", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500))]),
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
                  Text("Hafedh Guenichi", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500)),
                  Text("Following 23", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text("Settings", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(FontAwesome.user, size: 15, color: white),
              SizedBox(width: 20),
              Text("Edit Profile", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
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
              Text("Notification", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
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
              Text("Language", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              Spacer(),
              Text("English (US)", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
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
              const Text("Dark Mode", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              const Spacer(),
              StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) setS) {
                  return FlutterSwitch(
                    width: 80,
                    height: 30,
                    value: !user!.get("dark_mode"),
                    borderRadius: 5,
                    padding: 4,
                    showOnOff: true,
                    activeColor: pink,
                    activeText: "",
                    inactiveText: "",
                    inactiveIcon: const Icon(FontAwesome.sun_solid, size: 15, color: white),
                    activeIcon: const Icon(FontAwesome.moon_solid, size: 15, color: white),
                    onToggle: (bool value) {
                      user!.put("dark_mode", !user!.get("dark_mode"));
                      setS(() {});
                    },
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
              Icon(Bootstrap.shield, size: 15, color: white),
              SizedBox(width: 20),
              Text("Security", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text("Orders", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(Bootstrap.cart, size: 15, color: white),
              SizedBox(width: 20),
              Text("Manage my orders", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
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
              Text("Order history", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(Bootstrap.pin_map, size: 15, color: white),
              SizedBox(width: 20),
              Text("Manage shipping address", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text("Services", style: TextStyle(color: white, fontSize: 18, letterSpacing: 2, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(Bootstrap.lock, size: 15, color: white),
              SizedBox(width: 20),
              Text("Privacy policy", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(Bootstrap.info_circle, size: 15, color: white),
              SizedBox(width: 20),
              Text("Help Center", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(Bootstrap.people, size: 15, color: white),
              SizedBox(width: 20),
              Text("Invite friends", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              Spacer(),
              Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
            ],
          ),
        ),
      ],
    );
  }
}
