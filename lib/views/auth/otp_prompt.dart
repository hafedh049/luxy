import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class OTPPrompt extends StatefulWidget {
  const OTPPrompt({super.key});

  @override
  State<OTPPrompt> createState() => _OTPPromptState();
}

class _OTPPromptState extends State<OTPPrompt> {
  final List<String> _keyboard = List<String>.generate(9, (int index) => (index + 1).toString())..addAll(const <String>["*", "0", "C"]);
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
          children: <Widget>[
            const Spacer(),
            const Flexible(child: Text("Code has been sent to +216 223 56* **2", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500))),
            const SizedBox(height: 30),
            const SizedBox(height: 30),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const OTPPrompt()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: const Text("Verify", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: grey),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: _keyboard.length,
                  itemBuilder: itemBuilder,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
