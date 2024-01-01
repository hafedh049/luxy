import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  final List<Map<String, dynamic>> _notifications = <Map<String, dynamic>>[
    <String, dynamic>{
      "title": "General Notification",
      "callback": () async => user!.put("general_notification", !user!.get("general_notification")),
      "get": () => user!.get("general_notification"),
    },
    <String, dynamic>{
      "title": "Sound",
      "callback": () => user!.put("sound", !user!.get("sound")),
      "get": () => user!.get("sound"),
    },
    <String, dynamic>{
      "title": "Special Offers",
      "callback": () => user!.put("special_offers", !user!.get("special_offers")),
      "get": () => user!.get("special_offers"),
    },
    <String, dynamic>{
      "title": "Vibrate",
      "callback": () => user!.put("vibrate", !user!.get("vibrate")),
      "get": () => user!.get("vibrate"),
    },
    <String, dynamic>{
      "title": "Promote & Discount",
      "callback": () => user!.put("promote_discount", !user!.get("promote_discount")),
      "get": () => user!.get("promote_discount"),
    },
    <String, dynamic>{
      "title": "Payments",
      "callback": () => user!.put("payments", !user!.get("payments")),
      "get": () => user!.get("payments"),
    },
    <String, dynamic>{
      "title": "Cashback",
      "callback": () => user!.put("cashback", !user!.get("cashback")),
      "get": () => user!.get("cashback"),
    },
    <String, dynamic>{
      "title": "App Updates",
      "callback": () => user!.put("app_updates", !user!.get("app_updates")),
      "get": () => user!.get("app_updates"),
    },
    <String, dynamic>{
      "title": "New Service Available",
      "callback": () => user!.put("new_service_available", !user!.get("new_service_available")),
      "get": () => user!.get("new_service_available"),
    },
    <String, dynamic>{
      "title": "New Tips Available",
      "callback": () => user!.put("new_tips_available", !user!.get("new_tips_available")),
      "get": () => user!.get("new_tips_available"),
    },
  ];
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (final Map<String, dynamic> item in _notifications) ...<Widget>[
                GestureDetector(
                  onTap: () async {
                    await item["callback"]();
                  },
                  child: Row(
                    children: <Widget>[
                      Text(item["title"], style: const TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500)),
                      const Spacer(),
                      StatefulBuilder(
                        builder: (BuildContext context, void Function(void Function()) setS) {
                          return AnimatedToggleSwitch<bool>.dual(
                            current: item["get"](),
                            first: false,
                            second: true,
                            style: const ToggleStyle(indicatorColor: pink, borderColor: pink),
                            iconBuilder: (bool value) => Icon(value ? Bootstrap.check : Bootstrap.x_diamond, size: 15, color: white),
                            animationDuration: 500.ms,
                            animationCurve: Curves.bounceOut,
                            onChanged: (bool b) async {
                              await item["callback"]();
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
              ],
            ],
          ),
        ),
      ),
    );
  }
}
