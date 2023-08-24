import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/pages/leaderboards/leaderboard_controller.dart';
import 'package:hafilatuna/widgets/navbar/navbar.dart';
import 'package:hafilatuna/widgets/navbar/navbar_controller.dart';
import 'package:hafilatuna/widgets/top_bar.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController navbarController = Get.put(NavbarController());
    final c = Get.put(LeaderboardController());
    c.add();

    return Scaffold(
        appBar: const TopBar(
          pageTile: 'Leaderboard',
        ),
        bottomNavigationBar: Obx(() => Navbar(
            currentIndex: navbarController.selectedIndex.value,
            onItemTap: navbarController.onItemTap)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * 0.1,
                vertical: Get.height * 0.02,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.05,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image(
                        image:
                            Image.asset("assets/images/green_points.jpg").image,
                        width: 35,
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 70, left: 10),
                        child: Text(
                          c.activities[index].action.toString(),
                          style: const TextStyle(
                            color: Color(0xff2fa245),
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                      Text(
                        c.activities[index].name ?? "",
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
        ));
  }
}
