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
  Future<List<Map<String, dynamic>>> _load() async => json.decode(await rootBundle.loadString('assets/jsns/languages.json')).cast<Map<String, dynamic>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
        title: const Text("Language", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _load(),
              builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  final List<Map<String, dynamic>> data = snapshot.data!;
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      for (int address = 0; address < data.length; address += 1)
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.3)),
                          child: GestureDetector(
                            onTap: () {
                              if (_currentAddress != address) {
                                for (final Map<String, dynamic> map in data) {
                                  map["key"].currentState!.setState(() => _currentAddress = address);
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
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(data[address]["header"], style: const TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500)),
                                          const SizedBox(width: 20),
                                          const Icon(Bootstrap.pen, size: 10, color: white),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(data[address]["title"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                                          const Spacer(),
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
                                      Text(data[address]["subtitle"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
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
