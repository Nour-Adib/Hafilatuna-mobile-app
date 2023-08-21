import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/models/ticket.model.dart';
import 'package:hafilatuna/pages/ticket_details/views/ticket_details_view.dart';

import 'views/ticket_view.dart';

class HomeScreenController extends GetxController {
  final cardHeight = Get.height * 0.222;
  List<Ticket> dataList = [
    Ticket(
      studentName: 'Ahmed',
      schoolName: 'Al-Azhar',
      busNumber: '1',
      seatNumber: '1',
      currentStatus: 'In',
    ),
    Ticket(
      studentName: 'Mohamed',
      schoolName: 'Al-Azhar',
      busNumber: '1',
      seatNumber: '2',
      currentStatus: 'In',
    ),
    Ticket(
      studentName: 'Ali',
      schoolName: 'Al-Azhar',
      busNumber: '1',
      seatNumber: '3',
      currentStatus: 'In',
    ),
  ];

  getCardsList() {
    return dataList.map((ticket) {
      return CardModel(
        shadowBlurRadius: 7,
        shadowColor: Colors.grey.withOpacity(1),
        backgroundColor: const Color(0xFFffcb18),
        radius: const Radius.circular(15),
        child: InkWell(
          onTap: () {
            Get.to(() => TicketDetailsView(ticket: ticket),
                transition: Transition.rightToLeftWithFade);
          },
          child: TicketView(
            ticket: ticket,
          ),
        ),
      );
    }).toList();
  }
}
