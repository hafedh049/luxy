import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
                        Text(_orders[key]![index]["seller_name"], style: const TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500)),
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
