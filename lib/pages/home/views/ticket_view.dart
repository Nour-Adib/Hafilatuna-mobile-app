import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/models/ticket.model.dart';

import '../home_controller.dart';

class TicketView extends StatelessWidget {
  final Ticket ticket;
  const TicketView({required this.ticket, super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController c = Get.put(HomeScreenController());
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: Get.height * 0.2,
      width: Get.width * 0.8,
      child: Column(
        children: [
          Text(ticket.studentName ?? ""),
        ],
      ),
    );
  }
}
