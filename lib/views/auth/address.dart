import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: dark,
          leading: IconButton(
            icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Add your address", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: const Text("Skip", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: const Text("Continue", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
