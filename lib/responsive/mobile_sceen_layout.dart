import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

import '../utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
   late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
   @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
    void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: mobileBackgroundColor,
        key: _bottomNavigationKey,
        index: _page,
        height: 50.0,
        color: Colors.deepPurple,
        animationCurve:Curves.easeInOutCubicEmphasized,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.add_circle, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: navigationTapped,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
    );
  }
}
