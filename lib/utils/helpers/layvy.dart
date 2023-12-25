import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class Layvy extends StatelessWidget {
  const Layvy({super.key, this.fontSize = 35});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Icon(FontAwesome.wifi_solid, size: fontSize, color: pink),
            Text("La", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500, color: pink)),
          ],
        ),
        Text("yvy", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500, color: white)),
      ],
    );
  }
}
