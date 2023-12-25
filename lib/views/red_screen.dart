import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:luxy/utils/globals.dart';

class RedScreenOfDeath extends StatelessWidget {
  const RedScreenOfDeath({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width: MediaQuery.sizeOf(context).width * .6, child: Lottie.asset("assets/lotties/error.json")),
            const SizedBox(height: 20),
            Flexible(child: Text(error, style: const TextStyle(color: white, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w500))),
          ],
        ),
      ),
    );
  }
}
