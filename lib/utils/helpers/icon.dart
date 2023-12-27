import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:luxy/utils/globals.dart';

class Iconed extends StatefulWidget {
  const Iconed({super.key, required this.icon, required this.callback, this.iconSize = 15});
  final IconData icon;
  final void Function() callback;
  final double iconSize;
  @override
  State<Iconed> createState() => _IconedState();
}

class _IconedState extends State<Iconed> {
  bool _colorState = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (LongPressDownDetails details) async {
        setState(() => _colorState = true);
      },
      onLongPressUp: () async {
        setState(() => _colorState = false);
        widget.callback();
      },
      onTapUp: (TapUpDetails details) async {
        setState(() => _colorState = false);
        widget.callback();
      },
      onTapDown: (TapDownDetails details) async {
        setState(() => _colorState = true);
      },
      child: AnimatedContainer(
        duration: 500.ms,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(border: Border.all(width: 1, color: pink), shape: BoxShape.circle, color: _colorState ? pink : transparent),
        child: Icon(widget.icon, size: widget.iconSize, color: _colorState ? dark : white),
      ),
    );
  }
}
