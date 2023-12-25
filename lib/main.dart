import 'package:flutter/material.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/methods.dart';
import 'package:luxy/views/loading_screen.dart';
import 'package:luxy/views/onboarding.dart';
import 'package:luxy/views/red_screen.dart';

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
      home: FutureBuilder<bool>(
        future: load(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return const Onboarding();
            } else {
              return const RedScreenOfDeath(error: "Something Wrong");
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else {}
        },
      ),
    );
  }
}
