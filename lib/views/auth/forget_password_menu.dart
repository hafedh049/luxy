import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class ForgetPasswordMethods extends StatefulWidget {
  const ForgetPasswordMethods({super.key});

  @override
  State<ForgetPasswordMethods> createState() => _ForgetPasswordMethodsState();
}

class _ForgetPasswordMethodsState extends State<ForgetPasswordMethods> {
  final List<Map<String, dynamic>> _methods = <Map<String, dynamic>>[
    <String, dynamic>{"icon": Bootstrap.messenger, "title": "Via SMS", "subtitle": "+216 23 5** *02"},
    <String, dynamic>{"icon": Bootstrap.envelope_paper, "title": "Via E-mail", "subtitle": "hafedhg******@gmail.com"},
  ];
  int _currentMethod = 0;
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
          StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) _) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (final Map<String, dynamic> entry in _methods)
                    GestureDetector(
                      onTap: () => _(() => _currentMethod = _methods.indexOf(entry)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: pink),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
