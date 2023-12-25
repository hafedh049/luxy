import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/views/products.dart';
import 'package:luxy/views/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  final List<Widget> _pages = <Widget>[
    const Profile(),
    const Products(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: GNav(
          onTabChange: (int value) => _pageController.jumpToPage(value % 2),
          rippleColor: grey,
          haptic: true,
          tabBorderRadius: 15,
          curve: Curves.easeOutExpo,
          duration: 500.ms,
          gap: 8,
          color: grey,
          activeColor: pink,
          iconSize: 20,
          tabBackgroundColor: transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          tabs: const <GButton>[
            GButton(icon: FontAwesome.house_chimney_solid, text: 'Home'),
            GButton(icon: Bootstrap.grid, text: 'Products'),
            GButton(icon: FontAwesome.shop_solid, text: 'Shop'),
            GButton(icon: FontAwesome.person_rifle_solid, text: 'Profile'),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: PageView.builder(
            itemCount: _pages.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => _pages[index],
          ),
        ),
      ),
    );
  }
}
