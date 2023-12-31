import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/loading_screen.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
Future<List<Map<String,dynamic>>> _load()async=>
 json.decode( await rootBundle.loadString("assets/jsons/privacy_policy.json")).cast<Map<String,dynamic>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
        title: const Text("Privacy Policy For Layvy", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),child: FutureBuilder<List<Map<String,dynamic>>>(future:_load() , builder: (BuildContext context , AsyncSnapshot<List<Map<String,dynamic>>> snapshot) {
          if(snapshot.hasData){
            return ListView.separated(itemCount: ,
        separatorBuilder: (BuildContext context,int index) => const SizedBox(height: 20),
        itemBuilder: (BuildContext context, int index) => ,);
          }else if(snapshot.connectionState == ConnectionState.waiting){return const LoadingScreen(); }else {}
        },),
      ),
    );
  }
}
