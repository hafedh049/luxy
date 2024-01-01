import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> with TickerProviderStateMixin {
  final List<Map<String, dynamic>> _contactUs = <Map<String, dynamic>>[
    <String, dynamic>{"icon": FontAwesome.headphones_solid, "title": "Customer Service", "callback": () {}},
    <String, dynamic>{"icon": Bootstrap.whatsapp, "title": "Whatsapp", "callback": () {}},
    <String, dynamic>{"icon": Bootstrap.link, "title": "Website", "callback": () {}},
    <String, dynamic>{"icon": Bootstrap.facebook, "title": "Facebook", "callback": () {}},
    <String, dynamic>{"icon": Bootstrap.twitter_x, "title": "Twitter", "callback": () {}},
    <String, dynamic>{"icon": Bootstrap.instagram, "title": "Instagram", "callback": () {}},
  ];

  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
        title: const Text("Help Center", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: pink,
                    dividerColor: grey,
                    indicatorColor: pink,
                    onTap: (int value) => _tabController.animateTo(value, duration: 300.ms, curve: Curves.linear),
                    tabs: const <Tab>[Tab(text: 'Active'), Tab(text: 'Completed')],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (final Map<String, dynamic> item in _contactUs)
                        GestureDetector(
                          onTap: item["callback"](),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.1)),
                            child: Row(
                              children: <Widget>[
                                Icon(item["icon"], color: white, size: 15),
                                const SizedBox(width: 10),
                                Text(item["title"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}