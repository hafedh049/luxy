import 'package:flutter/material.dart';
import 'package:luxy/utils/globals.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: PageView.builder(
                controller: _onboardingController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int value) {},
                itemBuilder: (BuildContext context, int index) => Center(child: _onboardings[index]),
              ),
            ),
            Column(
              children: <Widget>[
                const Spacer(),
                AnimatedSmoothIndicator(
                  activeIndex: 0,
                  count: _onboardings.length,
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: StatefulBuilder(
                    key: null,
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return const Text("NEXT", style: TextStyle(color: pink, fontSize: 25, fontWeight: FontWeight.w500));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
