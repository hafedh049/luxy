import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/loading_screen.dart';
import 'package:luxy/views/red_screen.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final List<String> _romanNumerals = <String>['I', 'II', 'III', 'IV', 'V', 'VI'];

  Future<List<Map<String, dynamic>>> _load() async => json.decode(await rootBundle.loadString("assets/jsons/privacy_policy.json")).cast<Map<String, dynamic>>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
        title: const Text("Privacy Policy For Layvy", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _load(),
          builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              final List<Map<String, dynamic>> data = snapshot.data!;

              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20),
                      itemBuilder: (BuildContext context, int index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(child: Text("${_romanNumerals[index]}. ${data[index]["header"]}", style: const TextStyle(color: pink, fontSize: 20, fontWeight: FontWeight.bold))),
                          const SizedBox(height: 20),
                          for (final Map<String, dynamic> item in data[index]["subtitles"])
                            item["type"] == "text"
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      if (item['subtitle'] != null) Flexible(child: Container(margin: const EdgeInsets.only(bottom: 10), child: Text("${data[index]['subtitles'].indexOf(item) + 1}. ${item['subtitle']}", style: const TextStyle(color: pink, fontSize: 18, fontWeight: FontWeight.bold)))),
                                      for (final String text in item["data"]) Flexible(child: Container(margin: const EdgeInsets.only(bottom: 10), child: Text(text, style: const TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold)))),
                                    ],
                                  )
                                : item["type"] == "text with custom list"
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          if (item['subtitle'] != null) Flexible(child: Container(margin: const EdgeInsets.only(bottom: 10), child: Text("${data[index]['subtitles'].indexOf(item) + 1}. ${item['subtitle']}", style: const TextStyle(color: pink, fontSize: 18, fontWeight: FontWeight.bold)))),
                                          for (final dynamic customPuce in item["data"])
                                            Flexible(
                                              child: Container(
                                                margin: const EdgeInsets.only(bottom: 10),
                                                child: customPuce is String
                                                    ? Text(customPuce, style: TextStyle(color: white.withOpacity(.8), fontSize: 16, fontWeight: FontWeight.bold))
                                                    : RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(text: "● ${customPuce['word']}", style: const TextStyle(color: pink, fontSize: 16, fontWeight: FontWeight.bold)),
                                                            TextSpan(text: " ${customPuce['rest']}", style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                                                          ],
                                                        ),
                                                      ),
                                              ),
                                            ),
                                        ],
                                      )
                                    : item["type"] == "subtitle with nested ones"
                                        ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              if (item['subtitle'] != null) Flexible(child: Container(margin: const EdgeInsets.only(bottom: 10), child: Text("${data[index]['subtitles'].indexOf(item) + 1}. ${item['subtitle']}", style: const TextStyle(color: pink, fontSize: 18, fontWeight: FontWeight.bold)))),
                                              for (final Map<String, dynamic> element in item["data"])
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    element["type"] == "text with list"
                                                        ? Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: <Widget>[
                                                              Flexible(child: Container(margin: const EdgeInsets.only(bottom: 10), child: Text(element["data"][0], style: const TextStyle(color: pink, fontSize: 18, fontWeight: FontWeight.bold)))),
                                                              for (final String uplet in element["data"].skip(1))
                                                                Container(
                                                                  margin: const EdgeInsets.only(bottom: 10),
                                                                  child: RichText(
                                                                    text: TextSpan(
                                                                      children: <TextSpan>[
                                                                        const TextSpan(text: "●", style: TextStyle(color: pink, fontSize: 16, fontWeight: FontWeight.bold)),
                                                                        TextSpan(text: " $uplet", style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          )
                                                        : Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: <Widget>[
                                                              for (final String uplet in element["data"]) Flexible(child: Container(margin: const EdgeInsets.only(bottom: 10), child: Text(uplet, style: const TextStyle(color: pink, fontSize: 18, fontWeight: FontWeight.bold)))),
                                                            ],
                                                          )
                                                  ],
                                                ),
                                            ],
                                          )
                                        : Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              if (item['subtitle'] != null) Flexible(child: Container(margin: const EdgeInsets.only(bottom: 10), child: Text("${data[index]['subtitles'].indexOf(item) + 1}. ${item['subtitle']}", style: const TextStyle(color: pink, fontSize: 18, fontWeight: FontWeight.bold)))),
                                              for (final Map<String, dynamic> element in item["data"])
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    for (final dynamic uplet in element["data"])
                                                      uplet is String
                                                          ? const SizedBox()
                                                          : Container(
                                                              margin: const EdgeInsets.only(bottom: 10),
                                                              child: RichText(
                                                                text: TextSpan(
                                                                  children: <TextSpan>[
                                                                    const TextSpan(text: "●", style: TextStyle(color: pink, fontSize: 16, fontWeight: FontWeight.bold)),
                                                                    TextSpan(text: " $uplet", style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                  ],
                                                ),
                                            ],
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
              return RedScreenOfDeath(error: snapshot.error.toString());
            }
          },
        ),
      ),
    );
  }
}
