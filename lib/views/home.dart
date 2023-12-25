import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:luxy/utils/globals.dart';
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
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          rippleColor: grey,
          haptic: true,
          tabBorderRadius: 15,
          tabActiveBorder: Border.all(color: grey, width: 1),
          tabBorder: Border.all(color: grey, width: 1),
          tabShadow: [BoxShadow(color: grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
          curve: Curves.easeOutExpo,
          duration: 500.ms,
          gap: 8,
          color: grey, // unselected icon color
          activeColor: pink, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: pink.withOpacity(.1), // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
          tabs: [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: LineIcons.heart_o,
              text: 'Likes',
            ),
            GButton(
              icon: LineIcons.search,
              text: 'Search',
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profile',
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PageView.builder(
          itemCount: _pages.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => _pages[index],
        ),
      ),
    );
  }
}
