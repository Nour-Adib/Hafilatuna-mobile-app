import 'package:book_my_seat/book_my_seat.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/models/enums/accountType.enum.dart';
import 'package:hafilatuna/pages/add_card/views/created_ticket_screen.dart';
import 'package:hafilatuna/services/auth/auth.service.dart';
import 'package:hafilatuna/services/tickets/tickets.service.dart';
import 'package:hafilatuna/utility/error_handler.dart';
import 'package:hafilatuna/utility/logger.dart';
import 'package:hafilatuna/utility/snackbar.dart';

import '../../utility/shared_preferences.dart';

class AddCardController extends GetxController {
  final timePattern =
      RegExp(r'^(0?[1-9]|1[0-2]):[0-5][0-9](AM|PM)$', caseSensitive: false);

  var isSeatSelected = false.obs;
  var isSeatSelectedIndex = 0.obs;
  var isMultipleSelected = false.obs;

  TextEditingController dropdownTextFieldController = TextEditingController();
  var school = "".obs;
  TextEditingController timeTextFieldController = TextEditingController();

  var seatStates = [
    [
      SeatState.sold,
      SeatState.unselected,
      SeatState.sold,
      SeatState.unselected,
      SeatState.sold,
      SeatState.sold,
      SeatState.sold,
      SeatState.unselected,
      SeatState.sold,
      SeatState.unselected
    ],
    [
      SeatState.sold,
      SeatState.unselected,
      SeatState.sold,
      SeatState.unselected,
      SeatState.sold,
      SeatState.unselected,
      SeatState.sold,
      SeatState.unselected,
      SeatState.sold,
      SeatState.unselected
    ],
    [
      SeatState.empty,
      SeatState.empty,
      SeatState.empty,
      SeatState.empty,
      SeatState.empty,
      SeatState.empty,
      SeatState.empty,
      SeatState.empty,
      SeatState.empty,
      SeatState.empty
    ],
    [
      SeatState.unselected,
      SeatState.sold,
      SeatState.sold,
      SeatState.sold,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.sold,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.sold
    ],
    [
      SeatState.sold,
      SeatState.sold,
      SeatState.sold,
      SeatState.sold,
      SeatState.sold,
      SeatState.sold,
      SeatState.unselected,
      SeatState.sold,
      SeatState.unselected,
      SeatState.sold
    ],
  ].obs;

  final List<DropdownMenuEntry<String>> schoolsMenuItems =
      <DropdownMenuEntry<String>>[
    const DropdownMenuEntry(
      value: "Al Shurooq Private School",
      label: "Al Shurooq Private School",
    ),
    const DropdownMenuEntry(
      value: "Ambassador International Academy",
      label: "Ambassador International Academy",
    ),
    const DropdownMenuEntry(
      value: "Ambassador School",
      label: "Ambassador School",
    ),
    const DropdownMenuEntry(
      value: "American Academy for Girls",
      label: "American Academy for Girls",
    ),
    const DropdownMenuEntry(
      value: "American International School",
      label: "American International School",
    ),
    const DropdownMenuEntry(
      value: "American School of Creative Science",
      label: "American School of Creative Science",
    ),
    const DropdownMenuEntry(
      value: "American School of Dubai",
      label: "American School of Dubai",
    ),
  ];

  addCard() async {
    if (!timePattern.hasMatch(timeTextFieldController.text)) {
      SnackBarService.showErrorSnackbar('Error', 'Invalid pick up time format');
      return;
    }

    if (school.value.isEmpty) {
      SnackBarService.showErrorSnackbar('Error', 'Invalid school name');
      return;
    }

    if (!isSeatSelected.value) {
      SnackBarService.showErrorSnackbar('Error', 'User must select a seat');
      return;
    }

    if (isMultipleSelected.value) {
      SnackBarService.showErrorSnackbar('Error', 'Please only select 1 seat');
      return;
    }

    final dio = Dio(); // Provide a dio instance
    final ticketsService = TicketsService(dio);
    final CreateTicketRequest request = CreateTicketRequest();
    request.dropOffAddress = school.value;
    request.dropOffTime = timeTextFieldController.text;
    request.lat = '55.356399"';
    request.lon = '25.233737';
    request.seatNumber = isSeatSelectedIndex.value;

    final accessToken =
        await SharedPreferencesService.getFromShared('accessToken');

    ticketsService.addTicket('Bearer $accessToken', request).then((value) {
      SnackBarService.showSuccessSnackbar('Success', 'Card added successfully');
      sendToCreatedTicketScreen(value);
    }).catchError((error) {
      ErrorHandlerService.errorHandler(error);
    });
  }

  sendToCreatedTicketScreen(ticket) {
    Get.off(() => CreatedTicketScreen(ticket: ticket));
  }

  getSeatsState() {
    return seatStates;
  }

  setSelectedSeat(int rowIndex, int colIndex, SeatState updatedSeatState) {
    seatStates[rowIndex][colIndex] = updatedSeatState;

    if (updatedSeatState == SeatState.selected) {
      if (isSeatSelected.value) {
        SnackBarService.showErrorSnackbar('Error', 'Please only select 1 seat');
        isMultipleSelected.value = true;

        return;
      }

      isMultipleSelected.value = false;

      isSeatSelectedIndex.value = colIndex + rowIndex;
      isSeatSelected.value = true;
    }
    if (updatedSeatState == SeatState.unselected) {
      isSeatSelectedIndex.value = 0;
      isSeatSelected.value = false;
    }
  }
}
