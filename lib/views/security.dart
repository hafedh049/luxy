import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
        title: const Text("Security", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Row(
                children: <Widget>[
                  const Text("Remember me", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) setS) {
                      return AnimatedToggleSwitch<bool>.dual(
                        current: user!.get("remember_me"),
                        first: false,
                        second: true,
                        style: const ToggleStyle(indicatorColor: pink, borderColor: pink),
                        iconBuilder: (bool value) => Icon(value ? Bootstrap.check : Bootstrap.x_diamond, size: 15, color: white),
                        animationDuration: 500.ms,
                        animationCurve: Curves.bounceOut,
                        onChanged: (b) {
                          user!.put("remember_me", !user!.get("remember_me"));
                          setS(() {});
                        },
                        height: 30,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: <Widget>[
                  Text("Google Authentificator", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Icon(FontAwesome.chevron_right_solid, size: 15, color: white),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: const Text("Change Password", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
