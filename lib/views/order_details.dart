import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final List<Map<String, dynamic>> _products = <Map<String, dynamic>>[];

  @override
  void initState() {
    _products.addAll(
      List<Map<String, dynamic>>.generate(
        20,
        (int index) => <String, dynamic>{
          "product_name": "Product N°$index",
          "product_picture": "me.jpeg",
          "product_quantity": (Random().nextInt(60) + 1).toString(),
          "product_sku": (Random().nextInt(9) + 1).toString() + (Random().nextInt(4000) + 1000).toString(),
          "product_total": (Random().nextInt(1000) + 100).toString(),
        },
      ),
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
          IconButton(icon: const Icon(FontAwesome.ellipsis_solid, size: 15, color: white), onPressed: () {}),
        ],
        title: const Text("Order Details", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: grey),
                  child: Text("Order #${Random().nextInt(4000) + 1000}", style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                ),
                const Spacer(),
                Text(formatDate(DateTime.now(), <String>[dd, '-', mm, '-', yyyy, "\t", HH, ':', nn, ':', ss, " ", am]), style: const TextStyle(color: grey, fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
            Expanded(
              child: Container(
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
                          child: const Text("Products Details", style: TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {}, icon: const Icon(FontAwesome.chevron_down_solid, size: 15, color: white)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) => Row(
                          children: <Widget>[
                            Container(width: 80, height: 80, decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/pictures/${_products[index]["product_picture"]}"), fit: BoxFit.cover))),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(child: Text(_products[index]["product_name"], style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500))),
                                  const SizedBox(height: 10),
                                  Text("Quantity : ${_products[index]["product_quantity"]}", style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                                  Row(
                                    children: <Widget>[
                                      Text("Sku : ${_products[index]["product_sku"]}", style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
                                      const Spacer(),
                                      Text(_products[index]["product_total"], style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
                        itemCount: _products.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
