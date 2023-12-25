import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/helpers/layvy.dart';
import 'package:luxy/views/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _onboardingController = PageController();
  final GlobalKey<State> _buttonKey = GlobalKey<State>();
  final GlobalKey<State> _indicatorKey = GlobalKey<State>();
  final List<Widget> _onboardings = <Widget>[
    const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Layvy(),
        SizedBox(height: 40),
        Flexible(child: Text("Welcome To Layvy", style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.w500))),
        SizedBox(height: 20),
        Flexible(child: Text("Your E-Commerce\nHub", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center)),
      ],
    ),
    const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        Flexible(child: Text("Find exciting\nshopping events watch\nand interact with sellers", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center)),
      ],
    ),
    const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(child: Text("Shop for products you\nlove while you are watching", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center)),
      ],
    ),
    const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        Flexible(child: Text("Get started now and\nexperience a new way\nto shop", style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center)),
      ],
    ),
  ];

  int _activeIndex = 0;

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
                itemCount: _onboardings.length,
                controller: _onboardingController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int value) {
                  _indicatorKey.currentState!.setState(() => _activeIndex = value);
                  _buttonKey.currentState!.setState(() {});
                },
                itemBuilder: (BuildContext context, int index) => Center(child: _onboardings[index]),
              ),
            ),
            Column(
              children: <Widget>[
                const Spacer(),
                StatefulBuilder(
                  key: _indicatorKey,
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return AnimatedSmoothIndicator(
                      activeIndex: _activeIndex,
                      count: _onboardings.length,
                      duration: 500.ms,
                      effect: CustomizableEffect(
                        activeDotDecoration: DotDecoration(
                          width: 32,
                          height: 12,
                          color: pink,
                          rotationAngle: 180,
                          verticalOffset: -10,
                          borderRadius: BorderRadius.circular(24),
                          dotBorder: const DotBorder(padding: 2, width: 2, color: pink),
                        ),
                        dotDecoration: const DotDecoration(
                          width: 24,
                          height: 12,
                          color: white,
                          dotBorder: DotBorder(padding: 2, width: 2, color: white),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(2), topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(2)),
                          verticalOffset: 0,
                        ),
                        spacing: 6.0,
                        activeColorOverride: (int index) => pink,
                        inActiveColorOverride: (int index) => white,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    if (_activeIndex < _onboardings.length - 1) {
                      _onboardingController.nextPage(duration: 500.ms, curve: Curves.linear);
                    } else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const Home()));
                    }
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(25)),
                    child: StatefulBuilder(
                      key: _buttonKey,
                      builder: (BuildContext context, void Function(void Function()) _) {
                        return Text(_activeIndex < _onboardings.length - 1 ? "NEXT" : "GET STARTED", style: const TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.w500));
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
