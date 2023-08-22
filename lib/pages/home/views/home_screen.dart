import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/widgets/navbar/navbar.dart';
import 'package:hafilatuna/widgets/navbar/navbar_controller.dart';
import 'package:hafilatuna/widgets/top_bar.dart';

import '../home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController c = Get.put(HomeScreenController());
    final NavbarController navbarController = Get.put(NavbarController());

    return Scaffold(
      appBar: const TopBar(
        pageTile: 'Home',
      ),
      bottomNavigationBar: Obx(() => Navbar(
          currentIndex: navbarController.selectedIndex.value,
          onItemTap: navbarController.onItemTap)),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Center(
          child: SizedBox(
            width: Get.width,
            child: CardStackWidget(
              opacityChangeOnDrag: true,
              swipeOrientation: CardOrientation.both,
              cardDismissOrientation: CardOrientation.both,
              positionFactor: 5,
              scaleFactor: 1,
              alignment: Alignment.center,
              reverseOrder: true,
              animateCardScale: true,
              dismissedCardDuration: const Duration(milliseconds: 5000),
              cardList: c.getCardsList(),
            ),
          ),
        ),
      ),
    );
  }
}
