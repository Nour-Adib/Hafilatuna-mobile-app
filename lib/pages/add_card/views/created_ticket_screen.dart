import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/ticket.model.dart';
import '../../../widgets/navbar/navbar.dart';
import '../../../widgets/navbar/navbar_controller.dart';
import '../../../widgets/top_bar.dart';

class CreatedTicketScreen extends StatelessWidget {
  final Ticket ticket;
  const CreatedTicketScreen({required this.ticket, super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController navbarController = Get.put(NavbarController());
    return Scaffold(
      appBar: const TopBar(
        pageTile: 'Add Card',
        hasBackButton: true,
      ),
      bottomNavigationBar: Obx(() => Navbar(
          currentIndex: navbarController.selectedIndex.value,
          onItemTap: navbarController.onItemTap)),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text("Congratulations!\n Your ticket has been created!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
                textAlign: TextAlign.center),
            const SizedBox(height: 50),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SizedBox(
                  width: Get.width,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: const Color(0xFFffcb18),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      height: Get.height * 0.25,
                      width: Get.width * 0.8,
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            height: Get.height * 0.2,
                            width: Get.width * 0.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bus Code: ${ticket.busCode}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Inter",
                                  ),
                                ),
                                Text(
                                  "Seat Number: ${ticket.seatNumber}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Inter",
                                  ),
                                ),
                                Text(
                                  "Cluster Number: ${ticket.clusterNumber}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Inter",
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Text(
                                  ('${ticket.user!.firstName!} ${ticket.user!.lastName!}'),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Inter",
                                  ),
                                ),
                                Text(
                                  ticket.school?.schoolName ?? "",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Inter",
                                  ),
                                ),
                              ],
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
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
