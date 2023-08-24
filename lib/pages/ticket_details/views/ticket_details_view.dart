import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/pages/ticket_details/ticket_details_controller.dart';
import 'package:hafilatuna/widgets/loading_indicator.dart';

class TicketDetailsView extends StatelessWidget {
  final String ticketId;
  const TicketDetailsView({required this.ticketId, super.key});

  @override
  Widget build(BuildContext context) {
    final TicketDetailsController c = Get.put(TicketDetailsController());
    c.getTicketById(ticketId);

    return Scaffold(
        body: SafeArea(
      child: Obx(
        (() => Center(
              child: c.isLoading.value
                  ? const LoadingIndicator()
                  : Stack(children: [
                      SizedBox(
                        width: Get.width,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        "Done",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Inter",
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        print("Clicked");
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            CircleBorder>(
                                          const CircleBorder(),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          const Color(0xFFffcb18),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.more_horiz_rounded,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  SizedBox(
                                    width: Get.width,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.1),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0.5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
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
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 5),
                                              height: Get.height * 0.2,
                                              width: Get.width * 0.8,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Bus Code: ${c.ticket?.busCode}",
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: "Inter",
                                                    ),
                                                  ),
                                                  Text(
                                                    "Seat Number: ${c.ticket?.seatNumber}",
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: "Inter",
                                                    ),
                                                  ),
                                                  Text(
                                                    "Cluster Number: ${c.ticket?.clusterNumber}",
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: "Inter",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.01,
                                                  ),
                                                  Text(
                                                    ('${c.ticket?.user!.firstName!} ${c.ticket?.user!.lastName!}'),
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: "Inter",
                                                    ),
                                                  ),
                                                  Text(
                                                    c.ticket?.school
                                                            ?.schoolName ??
                                                        "",
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: "Inter",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Transform.translate(
                                                offset: Offset(
                                                    0, Get.height * 0.065),
                                                child: Transform.scale(
                                                  scaleX: 1.8,
                                                  child: Image.asset(
                                                    "assets/images/Dubai-Cityscape-Silhouette.png",
                                                    width: Get.width * 2,
                                                    color:
                                                        const Color(0xFFe6d57f),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(21.0),
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
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0.5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "Current Status: ${c.currentStatus}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Inter",
                                        color:
                                            Color.fromARGB(255, 179, 141, 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: Get.width * 0.1,
                                  right: Get.width * 0.1,
                                  top: Get.height * 0.05,
                                ),
                                child: const Text(
                                  "Latest Activity",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25),
                                ),
                              ),
                              ListView.builder(
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.1,
                                      vertical: Get.height * 0.02,
                                    ),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: c.activities[index].action ==
                                                  "Pickup"
                                              ? const Icon(
                                                  Icons.login,
                                                  color: Colors.green,
                                                )
                                              : const Icon(
                                                  Icons.logout,
                                                  color: Colors.red,
                                                ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.05,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              c.activities[index].action ?? "",
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "Inter",
                                              ),
                                            ),
                                            Text(
                                              c.dateAndTime(c.activities[index]
                                                  .createdAt!),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: "Inter",
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount: c.activities.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: ElevatedButton(
                          onPressed: (() => c.trackingButtonPressed()),
                          style: ButtonStyle(
                            shape:
                                MaterialStateProperty.all(const CircleBorder()),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFffcb18),
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              const Size(50, 50),
                            ),
                          ),
                          child: Icon(
                            (c.currentStatus == 'In bus'
                                ? Icons.location_on
                                : Icons.location_off),
                            size: 30,
                          ),
                        ),
                      ),
                    ]),
            )),
      ),
    ));
  }
}
