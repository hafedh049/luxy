import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  int _currentAddress = 0;
  final List<Map<String, dynamic>> _addresses = <Map<String, dynamic>>[
    <String, dynamic>{
      "header": "Home",
      "title": "Jaafar, Ariana | Tunisia",
      "subtitle": "+216 23 566 502",
      "key": GlobalKey<State>(),
    },
    <String, dynamic>{
      "header": "Office",
      "title": "Jaafar, Ariana | Tunisia",
      "subtitle": "+216 23 566 502",
      "key": GlobalKey<State>(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
        title: const Text("Shipping Address", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  for (int address = 0; address < _addresses.length; address += 1)
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.3)),
                      child: GestureDetector(
                        onTap: () {
                          if (_currentAddress != address) {
                            for (final Map<String, dynamic> map in _addresses) {
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
                                      Text(_addresses[address]["header"], style: const TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500)),
                                      const SizedBox(width: 20),
                                      const Icon(Bootstrap.pen, size: 10, color: white),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(_addresses[address]["title"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                                      const Spacer(),
                                      StatefulBuilder(
                                        key: _addresses[address]["key"],
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
                                  Text(_addresses[address]["subtitle"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: const Text("Add new address", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: const Text("Apply", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
