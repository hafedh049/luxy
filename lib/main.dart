import 'package:flutter/material.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/onboarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: dark),
      debugShowCheckedModeBanner: false,
      home: const Onboarding(),
    );
  }
}
