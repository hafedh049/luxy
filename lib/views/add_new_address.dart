import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../utils/globals.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
        actions: <Widget>[
          IconButton(icon: const Icon(FontAwesome.ellipsis_solid, size: 15, color: white), onPressed: () {}),
        ],
        title: const Text("Order Details", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),body: ,);
  }
}
