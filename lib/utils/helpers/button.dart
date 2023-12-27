import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:luxy/utils/globals.dart';

class Buttoned extends StatefulWidget {
  const Buttoned({super.key, required this.icon, required this.text, required this.callback, this.fontSize = 16});
  final String text;
  final IconData icon;
  final void Function() callback;
  final double fontSize;
  @override
  State<Buttoned> createState() => _ButtonedState();
}

class _ButtonedState extends State<Buttoned> {
  bool _borderState = false;
  bool _colorState = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (LongPressDownDetails details) async {
        setState(() => _colorState = true);
        await Future.delayed(300.ms);
        setState(() => _borderState = true);
      },
      onLongPressUp: () async {
        setState(() => _colorState = false);
        await Future.delayed(300.ms);
        setState(() => _borderState = false);
        widget.callback();
      },
      onTapUp: (TapUpDetails details) async {
        setState(() => _colorState = false);
        await Future.delayed(700.ms);
        setState(() => _borderState = false);
        widget.callback();
      },
      onTapDown: (TapDownDetails details) async {
        setState(() => _colorState = true);
        await Future.delayed(300.ms);
        setState(() => _borderState = true);
      },
      child: AnimatedContainer(
        duration: 500.ms,
        padding: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all(width: 1, color: _borderState ? pink : transparent), borderRadius: BorderRadius.circular(15), color: _colorState ? pink : transparent),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(widget.icon, size: widget.fontSize, color: _colorState ? dark : null),
            if (widget.text.isNotEmpty) ...<Widget>[
              const SizedBox(width: 10),
              Text(widget.text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: widget.fontSize, color: _colorState ? dark : null)),
            ],
          ],
        ),
      ),
    );
  }
}
