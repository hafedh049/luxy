import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final TextEditingController _localisationController = TextEditingController();
  @override
  void dispose() {
    _localisationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            children: <Widget>[
              const Text("Address Details", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                child: TextField(
                  controller: _localisationController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                    hintText: "Location",
                    hintStyle: TextStyle(color: grey),
                    suffix: Icon(Bootstrap.pin_map, size: 15, color: grey),
                  ),
                ),
              ),
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
