import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: SizedBox(width: MediaQuery.sizeOf(context).width * .6, child: Lottie.asset("assets/lotties/wait.json"))));
}
