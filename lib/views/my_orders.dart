import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final List<List<Map<String, dynamic>>> _orders = <List<Map<String, dynamic>>>[];

  @override
  void initState() {
    _orders.addAll(
      <List<Map<String, dynamic>>>[
        List<Map<String, dynamic>>.generate(
          20,
          (int index) => <String, dynamic>{
            "orderID": Random().nextInt(3000) + 1000,
          },
        ),
      ],
    );
    super.initState();
  }

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
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: grey),
                            child: const Text("Order #3244", style: TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.lightBlue),
                            child: const Text("Pending", style: TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/pictures/me.jpeg"), fit: BoxFit.cover))),
                          const SizedBox(width: 10),
                          const Text("Hafedh Guenichi", style: TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(width: 80, height: 80, decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/pictures/me.jpeg"), fit: BoxFit.cover))),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(child: const Text("Product name", style: TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500))),
                                const SizedBox(height: 10),
                                const Text("Quantity : 3", style: TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                                const Text("Sku : 24234", style: TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(15)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("View Details", style: TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      )
                    ],
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
