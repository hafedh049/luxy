import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
        actions: <Widget>[
          IconButton(icon: const Icon(FontAwesome.searchengin_brand, size: 15, color: white), onPressed: () {}),
        ],
        title: const Text("My Orders", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TabBarView(
          children: <Tab>[
            Tab(
              text: "Active",
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) => Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.3)),
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
