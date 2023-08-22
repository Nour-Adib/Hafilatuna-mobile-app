import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String pageTile;
  final bool hasBackButton;

  const TopBar({
    super.key,
    required this.pageTile,
    this.height = kToolbarHeight,
    this.hasBackButton = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: Get.width * 0.3,
            ),
            Text(
              pageTile,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/images/rtaLogo.png',
              width: Get.width * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
