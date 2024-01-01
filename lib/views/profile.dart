import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/edit_profile.dart';
import 'package:luxy/views/languages_list.dart';
import 'package:luxy/views/privacy_policy.dart';
import 'package:luxy/views/security.dart';

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
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Text("Profile", style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.w500))]),
        Row(
          children: <Widget>[
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return GestureDetector(onTap: () {}, child: const CircleAvatar(radius: 25, backgroundImage: AssetImage("assets/pictures/me.jpeg")));
              },
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text("Hafedh Guenichi", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500)),
                Text("Following 23", style: TextStyle(color: white.withOpacity(.6), fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(color: grey, height: .8, thickness: .8),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: pink.withOpacity(.6)),
            child: const Row(
              children: <Widget>[
                Icon(FontAwesome.file_code, size: 15, color: white),
                SizedBox(width: 20),
                Text("Become a SELLER", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                Spacer(),
                Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text("SETTINGS", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const EditProfile()));
          },
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
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const LanguagesList()));
          },
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
                  return AnimatedToggleSwitch<bool>.dual(
                    current: user!.get("dark_mode"),
                    first: false,
                    second: true,
                    style: const ToggleStyle(indicatorColor: pink, borderColor: pink),
                    iconBuilder: (bool value) => Icon(value ? Bootstrap.moon_stars_fill : Bootstrap.sun_fill, size: 15, color: white),
                    animationDuration: 500.ms,
                    animationCurve: Curves.bounceOut,
                    onChanged: (b) {
                      user!.put("dark_mode", !user!.get("dark_mode"));
                      setS(() {});
                    },
                    height: 30,
                  );
                },
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Security()));
          },
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
        const Text("ORDERS", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
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
        const Text("SERVICES", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const PrivacyPolicy()));
          },
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
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: const Row(
            children: <Widget>[
              Icon(FontAwesome.leaf_solid, size: 15, color: pink),
              SizedBox(width: 20),
              Text("Sign Out", style: TextStyle(color: pink, fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }
}
