import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/order_details.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final Map<String, List<Map<String, dynamic>>> _orders = <String, List<Map<String, dynamic>>>{};
  final List<String> _orderStates = <String>["Pending", "Awaiting Shipment", "In Delivery", "Completed"];
  @override
  void initState() {
    _orders.addAll(
      <String, List<Map<String, dynamic>>>{
        "Active": List<Map<String, dynamic>>.generate(
          20,
          (int index) => <String, dynamic>{
            "order_id": (Random().nextInt(3000) + 1000).toString(),
            "order_state": _orderStates[Random().nextInt(_orderStates.length - 1)],
            "seller_name": "Hafedh Gunichi",
            "seller_picture": "me.jpeg",
            "product_name": "Product N°$index",
            "product_picture": "me.jpeg",
            "order_quantity": (Random().nextInt(60) + 1).toString(),
            "order_sku": (Random().nextInt(9) + 1).toString() + (Random().nextInt(4000) + 1000).toString(),
          },
        ),
        "Completed": List<Map<String, dynamic>>.generate(
          20,
          (int index) => <String, dynamic>{
            "order_id": (Random().nextInt(3000) + 1000).toString(),
            "order_state": _orderStates[Random().nextInt(_orderStates.length - 1)],
            "seller_name": "Hafedh Gunichi",
            "seller_picture": "me.jpeg",
            "product_name": "Product N°$index",
            "product_picture": "me.jpeg",
            "order_quantity": Random().nextInt(60) + 1,
            "order_sku": (Random().nextInt(9) + 1).toString() + (Random().nextInt(4000) + 1000).toString(),
          },
        ),
      },
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
          children: <Widget>[
            for (final String key in _orders.keys)
              Tab(
                //text: key,
                child: ListView.builder(
                  itemCount: _orders[key]!.length,
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
                              child: Text(_orders[key]![index]["order_id"], style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.lightBlue),
                              child: Text(_orders[key]![index]["order_state"], style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/pictures/${_orders[key]![index]["seller_picture"]}"), fit: BoxFit.cover))),
                            const SizedBox(width: 10),
                            Text(_orders[key]![index]["seller_name"], style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(width: 80, height: 80, decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/pictures/${_orders[key]![index]["product_picture"]}"), fit: BoxFit.cover))),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(child: Text(_orders[key]![index]["product_name"], style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500))),
                                  const SizedBox(height: 10),
                                  Text("Quantity : ${_orders[key]![index]["order_quantity"]}", style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                                  Text("Sku : ${_orders[key]![index]["order_sku"]}", style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const OrderDetails()));
                          },
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
