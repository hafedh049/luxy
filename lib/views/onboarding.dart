import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<Widget> _onboardings = <Widget>[
    Column(
      children: <Widget>[],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: PageView.builder(itemBuilder: (context, index) => _onboardings[index],),),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedSmoothIndicator(
                activeIndex: ,
                count: _onboardings.length,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
