import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:card_stack_widget/widget/card_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/widgets/top_bar.dart';

import '../home_controller.dart';
import 'ticket_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController c = Get.put(HomeScreenController());

    return Scaffold(
      appBar: const TopBar(
        pageTile: 'Home',
      ),
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
