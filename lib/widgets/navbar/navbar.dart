import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
    required this.currentIndex,
    required this.onItemTap,
  }) : super(key: key);

  final int currentIndex;
  final Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: const Color.fromARGB(38, 255, 201, 24),
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: const Color.fromARGB(255, 255, 199, 15),
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: const Color.fromARGB(38, 255, 201, 24),
            color: Colors.black,
            tabs: const [
              GButton(
                icon: CupertinoIcons.chart_bar_circle,
                text: 'Leaderboard',
              ),
              GButton(
                icon: CupertinoIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: CupertinoIcons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: currentIndex,
            onTabChange: onItemTap,
          ),
        ),
      ),
    );
  }
}
