import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/models/activity.model.dart';
import 'package:hafilatuna/models/ticket.model.dart';
import 'package:hafilatuna/pages/maps/maps_screen.dart';
import 'package:hafilatuna/services/tickets/tickets.service.dart';
import 'package:hafilatuna/utility/logger.dart';
import 'package:hafilatuna/utility/shared_preferences.dart';

class TicketDetailsController extends GetxController {
  Ticket? ticket;
  List<Activity> activities = [];
  String currentStatus = '';
  var isLoading = false.obs;

  getTicketById(String id) async {
    toggleLoading();
    final dio = Dio();
    final ticketsService = TicketsService(dio);

    final accessToken =
        await SharedPreferencesService.getFromShared('accessToken');

    LoggerService().logError(accessToken);

    await ticketsService
        .getTicketById('Bearer $accessToken', id)
        .then((response) {
      ticket = response;

      if (response.activities!.length >= 7) {
        activities = response.activities!.sublist(0, 7);
      } else {
        activities = response.activities!;
      }
      checkCount();
      toggleLoading();
    });
  }

  trackingButtonPressed() {
    if (activities[0].action == 'Pickup') {
      Get.to(() => MapScreen(ticketId: ticket?.id ?? ''),
          transition: Transition.rightToLeftWithFade);
    }
  }

  dateAndTime(String dateTime) {
    final date = dateTime.split('T')[0];
    final time = dateTime.split('T')[1].split('.')[0];
    return '$date $time';
  }

  checkCount() {
    if (activities.length <= 5) {
      setStatus(activities.length);
    } else {
      final date = getDate(activities[0].createdAt!);
      int count = 0;
      for (var i = 0; i < 4; i++) {
        if (getDate(activities[i].createdAt!) == date) {
          count++;
        }
      }
      setStatus(count);
    }
  }

  setStatus(int count) {
    if (activities.isNotEmpty && activities[0].action == 'Pickup') {
      currentStatus = 'In bus';
    } else if (count == 0 || count == 4) {
      currentStatus = 'At Home';
    } else if (count == 2) {
      currentStatus = 'At School';
    } else {
      currentStatus = 'Unknown';
    }
  }

  getDate(String dateTime) {
    final date = dateTime.split('T')[0];
    final day = date.split('-')[2];
    return day;
  }

  toggleLoading() {
    isLoading.value = !isLoading.value;
  }
}
