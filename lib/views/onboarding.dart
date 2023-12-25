import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _onboardingController = PageController();
  final List<Widget> _onboardings = <Widget>[
    Column(
      children: <Widget>[],
    ),
  ];

  @override
  void dispose() {
    _onboardingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: PageView.builder(controller: _onboardingController, itemBuilder: (context, index) => _onboardings[index],),),
          Column(
            children: <Widget>[const Spacer(),
              AnimatedSmoothIndicator(
                activeIndex: ,
                count: _onboardings.length,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
