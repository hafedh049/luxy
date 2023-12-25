import 'package:flutter/material.dart';
import 'package:luxy/utils/globals.dart';

class RedScreenOfDeath extends StatelessWidget {
  const RedScreenOfDeath({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 20),
            Flexible(child: Text("Privacy policy", style: TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500))),
          ],
        ),
      ),
    );
  }
}
