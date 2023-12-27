import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/product.dart';
import 'package:luxy/views/shipping_address.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),
          const Text("Products", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              padding: EdgeInsets.zero,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
              itemBuilder: (BuildContext context, int index) => Container(
                padding: const EdgeInsets.all(8),
                height: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.3)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Product()));
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(image: AssetImage("assets/pictures/me.jpeg"), fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Flexible(child: Text("Product name", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500))),
                            const Text("Size : 42", style: TextStyle(color: grey, fontSize: 12, fontWeight: FontWeight.w500)),
                            Row(
                              children: <Widget>[
                                const Text("80 TND", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: grey.withOpacity(.6)),
                                  child: const Text("6", style: TextStyle(color: white, fontSize: 12, fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IconButton(onPressed: () {}, icon: const Icon(FontAwesome.x_solid, size: 15, color: grey)),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 1, height: 2, color: grey),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.3)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ShippingAddress()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text("Shipping Details", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: grey.withOpacity(.6)),
                        child: const Icon(Bootstrap.pen, size: 10, color: white),
                      ),
                    ],
                  ),
                  const Text("Hafedh Guenichi", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.bold)),
                  const Text("Jaafar | Ariana - Tunisia", style: TextStyle(color: white, fontSize: 12, fontWeight: FontWeight.w500)),
                  const Text("+216 23 566 502", style: TextStyle(color: white, fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.3)),
            child: GestureDetector(
              onTap: () {},
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Payment Details", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                  Row(
                    children: <Widget>[
                      Text("Total items", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                      Spacer(),
                      Text("6", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Shipping Charges", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                      Spacer(),
                      Text("7 000 DT", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Total Price", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                      Spacer(),
                      Text("2 545 000 DT", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
