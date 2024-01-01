import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/loading_screen.dart';
import 'package:luxy/views/red_screen.dart';

class LanguagesList extends StatefulWidget {
  const LanguagesList({super.key});

  @override
  State<LanguagesList> createState() => _LanguagesListState();
}

class _LanguagesListState extends State<LanguagesList> {
  Future<List<Map<String, dynamic>>> _load() async {
    final List<Map<String, dynamic>> data = json.decode(await rootBundle.loadString('assets/jsns/languages.json')).cast<Map<String, dynamic>>().map(
      (Map<String, dynamic> e) {
        e["key"] = GlobalKey<State>();
      },
    );
    return data;
  }

  String _currentLanguage = "en";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
        title: const Text("Languages", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _load(),
              builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  final List<Map<String, dynamic>> data = snapshot.data!;
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: data.length,
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20),
                    itemBuilder: (BuildContext context, int index) => Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.3)),
                      child: GestureDetector(
                        onTap: () {
                          if (_currentLanguage != data[index]["code"]) {
                            for (final Map<String, dynamic> language in data) {
                              language["key"].currentState!.setState(() => _currentLanguage = language["code"]);
                            }
                          }
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(border: Border.all(width: 2, color: grey), shape: BoxShape.circle, color: grey.withOpacity(.6)),
                              child: const Icon(Bootstrap.pen, size: 25, color: white),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(data[index]["title"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                                            const SizedBox(height: 20),
                                            RichText(
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  const TextSpan(text: "Native name : ", style: TextStyle(color: pink, fontSize: 12, fontWeight: FontWeight.w500)),
                                                  TextSpan(text: data[index]["nativeName"], style: const TextStyle(color: white, fontSize: 12, fontWeight: FontWeight.w500)),
                                                ],
                                              ),
                                            ),
                                            Text(data[address]["subtitle"], style: const TextStyle(color: white, fontSize: 12, fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                      StatefulBuilder(
                                        key: data[address]["key"],
                                        builder: (BuildContext context, void Function(void Function()) _) {
                                          return AnimatedContainer(
                                            duration: 500.ms,
                                            width: 25,
                                            height: 25,
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: _currentAddress == address ? pink : grey.withOpacity(.6))),
                                            child: AnimatedContainer(
                                              duration: 500.ms,
                                              decoration: BoxDecoration(shape: BoxShape.circle, color: _currentAddress == address ? pink : grey.withOpacity(.6)),
                                              margin: const EdgeInsets.all(1),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingScreen();
                } else {
                  return Center(child: RedScreenOfDeath(error: snapshot.error.toString()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
