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
    return SizedBox(
      height: Get.height * 0.25,
      width: Get.width * 0.8,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: Get.height * 0.2,
            width: Get.width * 0.8,
            child: Text(
              ticket.studentName ?? "",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                fontFamily: "Inter",
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Transform.translate(
              offset: Offset(0, Get.height * 0.065),
              child: Transform.scale(
                scaleX: 1.8,
                child: Image.asset(
                  "assets/images/Dubai-Cityscape-Silhouette.png",
                  width: Get.width * 2,
                  color: const Color(0xFFe6d57f),
                ),
              ),
            ),
          ),
          ClipRect(
            child: Transform.scale(
              scale: 1.5,
              child: Transform.rotate(
                angle: 90,
                child: Image.asset(
                  "assets/images/wavePattern.png",
                  color: Colors.white,
                  height: Get.height,
                  width: Get.width,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: ClipRect(
              child: Image.asset(
                "assets/images/nolLogo.png",
                color: Colors.white,
                height: 75,
                width: 75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
