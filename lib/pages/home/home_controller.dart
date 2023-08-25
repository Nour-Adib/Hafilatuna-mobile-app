import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/models/ticket.model.dart';
import 'package:hafilatuna/pages/ticket_details/views/ticket_details_view.dart';
import 'package:hafilatuna/services/tickets/tickets.service.dart';
import 'package:hafilatuna/utility/error_handler.dart';
import 'package:hafilatuna/utility/logger.dart';
import 'package:hafilatuna/utility/logout.dart';
import 'package:hafilatuna/utility/shared_preferences.dart';

import 'views/ticket_view.dart';

class HomeScreenController extends GetxController {
  final cardHeight = Get.height * 0.222;
  List<Ticket> dataList = [];
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  getTickets() async {
    toggleLoading();
    final dio = Dio();
    final ticketsService = TicketsService(dio);

    final accessToken =
        await SharedPreferencesService.getFromShared('accessToken');

    if (accessToken == '') {
      LogoutService.logout();
    }

    await ticketsService.getTickets('Bearer $accessToken').then((response) {
      dataList = response;
      toggleLoading();
    }).catchError((error) {
      LoggerService().logError(error.toString());
      if (error.response.statusCode == 401) {
        LogoutService.logout();
      } else {
        ErrorHandlerService.errorHandler(error);
      }
      toggleLoading();
    });
  }

  getTicketById(String id) async {
    final dio = Dio();
    final ticketsService = TicketsService(dio);

    final accessToken =
        await SharedPreferencesService.getFromShared('accessToken');

    LoggerService().logError(accessToken);

    await ticketsService
        .getTicketById('Bearer $accessToken', id)
        .then((response) {
      return response;
    });
  }

  getCardsList() {
    return dataList.map((ticket) {
      return CardModel(
        shadowBlurRadius: 7,
        shadowColor: Colors.grey.withOpacity(1),
        backgroundColor: const Color(0xFFffcb18),
        radius: const Radius.circular(15),
        child: InkWell(
          onTap: () {
            Get.to(() => TicketDetailsView(ticketId: ticket.id ?? ''),
                transition: Transition.rightToLeftWithFade);
          },
          child: TicketView(
            ticket: ticket,
          ),
        ),
      );
    }).toList();
  }

  toggleLoading() {
    isLoading.value = !isLoading.value;
  }
}
