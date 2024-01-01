import 'package:flutter/material.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[GestureDetector(
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
        ),],
      ),
    );
  }
}
