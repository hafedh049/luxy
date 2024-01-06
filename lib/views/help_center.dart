import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
//import 'package:luxy/views/customer_service.dart';
import 'package:luxy/views/loading_screen.dart';
import 'package:luxy/views/red_screen.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> with TickerProviderStateMixin {
  final GlobalKey<State> _filterKey = GlobalKey<State>();

  final List<Map<String, dynamic>> _contactUs = <Map<String, dynamic>>[
    <String, dynamic>{
      "icon": FontAwesome.headphones_solid,
      "title": "Customer Service",
      "callback": (BuildContext context) {
        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CustomerService()));
      },
    },
    <String, dynamic>{"icon": Bootstrap.whatsapp, "title": "Whatsapp", "callback": (BuildContext context) {}},
    <String, dynamic>{"icon": Bootstrap.link, "title": "Website", "callback": (BuildContext context) {}},
    <String, dynamic>{"icon": Bootstrap.facebook, "title": "Facebook", "callback": (BuildContext context) {}},
    <String, dynamic>{"icon": Bootstrap.twitter_x, "title": "Twitter", "callback": (BuildContext context) {}},
    <String, dynamic>{"icon": Bootstrap.instagram, "title": "Instagram", "callback": (BuildContext context) {}},
  ];

  final List<String> _hints = <String>[];

  late final TabController _tabController;

  final TextEditingController _searchController = TextEditingController();

  Future<List<Map<String, dynamic>>> _load() async => jsonDecode(await rootBundle.loadString("assets/jsons/faqs.json")).cast<Map<String, dynamic>>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
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
                    tabs: const <Tab>[Tab(text: 'FAQ'), Tab(text: 'Contact Us')],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: white, width: 1.5), color: grey.withOpacity(.1)),
                          child: TextField(
                            cursorColor: pink,
                            controller: _searchController,
                            autofillHints: _hints,
                            style: const TextStyle(color: white, fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Bootstrap.search, size: 15, color: white),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Search",
                              hintStyle: TextStyle(color: grey, fontWeight: FontWeight.w500),
                            ),
                            onChanged: (String value) => _filterKey.currentState!.setState(() {}),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: _load(),
                            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                              if (snapshot.hasData) {
                                return StatefulBuilder(
                                    key: _filterKey,
                                    builder: (BuildContext context, void Function(void Function()) _) {
                                      final List<Map<String, dynamic>> data = snapshot.data!.where((Map<String, dynamic> element) => element["question"].toLowerCase().startsWith(_searchController.text.trim().toLowerCase())).toList();
                                      return ListView.separated(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (BuildContext context, int index) => Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.1)),
                                          child: StatefulBuilder(
                                            builder: (BuildContext context, void Function(void Function()) _) {
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Expanded(child: Text(data[index]["question"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500))),
                                                      const SizedBox(width: 10),
                                                      IconButton(onPressed: () => _(() => data[index]["state"] = !data[index]["state"]), icon: Icon(data[index]["state"] ? FontAwesome.arrow_up_solid : FontAwesome.arrow_down_solid, color: white, size: 15)),
                                                    ],
                                                  ),
                                                  if (data[index]["state"]) ...<Widget>[
                                                    const SizedBox(height: 10),
                                                    const Divider(thickness: .5, height: .5, color: grey),
                                                    const SizedBox(height: 10),
                                                    Flexible(child: Text(data[index]["answer"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500))),
                                                  ],
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20),
                                        itemCount: data.length,
                                      );
                                    });
                              } else if (snapshot.connectionState == ConnectionState.waiting) {
                                return const LoadingScreen();
                              } else {
                                return RedScreenOfDeath(error: snapshot.error.toString());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 16),
                      for (final Map<String, dynamic> item in _contactUs)
                        GestureDetector(
                          onTap: () => item["callback"](context),
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
