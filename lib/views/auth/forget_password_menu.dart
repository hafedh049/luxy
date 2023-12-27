import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class ForgetPasswordMenu extends StatefulWidget {
  const ForgetPasswordMenu({super.key});

  @override
  State<ForgetPasswordMenu> createState() => _ForgetPasswordMenuState();
}

class _ForgetPasswordMenuState extends State<ForgetPasswordMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(
          icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Create new password", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SizedBox(),
          ),
          const Flexible(child: Text("Select which contact details should we use to reset your password", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500))),
          const SizedBox(height: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}
