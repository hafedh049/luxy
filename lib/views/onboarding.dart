import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/helpers/layvy.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _onboardingController = PageController();
  final GlobalKey<State> _buttonKey = GlobalKey<State>();
  final List<Widget> _onboardings = <Widget>[
    Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Layvy(),
      ],
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
                onPageChanged: (int value) => _buttonKey.currentState!.setState(() {}),
                itemBuilder: (BuildContext context, int index) => Center(child: _onboardings[index]),
              ),
            ),
            Column(
              children: <Widget>[
                const Spacer(),
                AnimatedSmoothIndicator(
                  activeIndex: _onboardingController.page!.toInt(),
                  count: _onboardings.length,
                  duration: 500.ms,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _onboardingController.nextPage(duration: 500.ms, curve: Curves.linear),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: StatefulBuilder(
                      key: _buttonKey,
                      builder: (BuildContext context, void Function(void Function()) _) {
                        return Text(_onboardingController.page!.toInt() < 3 ? "NEXT" : "GET STARTED", style: const TextStyle(color: pink, fontSize: 25, fontWeight: FontWeight.w500));
                      },
                    ),
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
