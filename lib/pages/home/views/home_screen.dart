import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:card_stack_widget/widget/card_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';
import 'ticket_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController c = Get.put(HomeScreenController());

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: Get.height,
          child: CardStackWidget(
            opacityChangeOnDrag: true,
            swipeOrientation: CardOrientation.both,
            cardDismissOrientation: CardOrientation.both,
            positionFactor: 7,
            scaleFactor: 1,
            alignment: Alignment.center,
            reverseOrder: true,
            animateCardScale: true,
            dismissedCardDuration: const Duration(milliseconds: 5000),
            cardList: c.getCardsList(),
          ),
        ),
      ),
    );
  }
}
/**
 * CarouselSlider(
            options: CarouselOptions(
              scrollDirection: Axis.vertical,
              enlargeCenterPage: true,
              viewportFraction: 0.5,
              enableInfiniteScroll: false,
            ),
            items: c.dataList.map((ticket) {
              return TicketView(
                ticket: ticket,
              );
            }).toList(),
          ),
 */
