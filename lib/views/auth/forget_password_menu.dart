import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/auth/otp_prompt.dart';

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
        title: const Text("Forgot Password", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
                        onTap: () {
                          if (_currentMethod != _methods.indexOf(entry)) {
                            _(() => _currentMethod = _methods.indexOf(entry));
                          }
                        },
                        child: AnimatedContainer(
                          duration: 500.ms,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: _currentMethod == _methods.indexOf(entry) ? pink : grey, width: 2),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(shape: BoxShape.circle, color: grey.withOpacity(.6)),
                                child: Icon(entry["icon"], size: 25, color: white),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(entry["title"], style: const TextStyle(color: grey, fontSize: 14, fontWeight: FontWeight.w500)),
                                  Text(entry["subtitle"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const OTPPrompt()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: const Text("Continue", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
