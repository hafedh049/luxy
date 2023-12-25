import 'package:flutter/material.dart';
import 'package:luxy/utils/globals.dart';

class Layvy extends StatelessWidget {
  const Layvy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Icon()
            Text("La", style: TextStyle(fontSize: fontsize, fontWeight: FontWeight.w500, color: pink)),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[],
        )
      ],
    );
  }
}
