import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/widgets/navbar/navbar.dart';

import '../../../widgets/navbar/navbar_controller.dart';
import '../../../widgets/top_bar.dart';
import '../add_card_controller.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddCardController c = Get.put(AddCardController());
    final NavbarController navbarController = Get.put(NavbarController());
    return Scaffold(
      appBar: const TopBar(
        pageTile: 'Add Card',
        hasBackButton: true,
      ),
      bottomNavigationBar: Obx(() => Navbar(
          currentIndex: navbarController.selectedIndex.value,
          onItemTap: navbarController.onItemTap)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: SizedBox(
                      width: Get.width * 0.75,
                      child: DropdownMenu<String>(
                        dropdownMenuEntries: c.schoolsMenuItems,
                        initialSelection: c.school.value,
                        width: Get.width * 0.75,
                        label: const Text(
                          'Drop Off School',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onSelected: (String? value) {
                          c.school.value = value ?? '';
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: Get.width * 0.75,
                      child: TextFormField(
                        controller: c.timeTextFieldController,
                        decoration: const InputDecoration(
                          labelText: 'Drop Off Time',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.w700,
                          ),
                          hintText: ("XX:XXAM"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: Get.width * 0.75,
                      child: const Text(
                        'Pickup point will be as per your current location',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() => Container(
                        color: Colors.blueGrey.shade300,
                        width: Get.width * 0.9,
                        child: SeatLayoutWidget(
                          onSeatStateChanged:
                              (rowIndex, colIndex, updatedSeatState) {
                            c.setSelectedSeat(
                                rowIndex, colIndex, updatedSeatState);
                          },
                          stateModel: SeatLayoutStateModel(
                            rows: 5,
                            cols: 10,
                            seatSvgSize: 30,
                            pathUnSelectedSeat:
                                'assets/images/svg_unselected_bus_seat.svg',
                            pathSelectedSeat:
                                'assets/images/svg_selected_bus_seat.svg',
                            pathSoldSeat: 'assets/images/svg_sold_bus_seat.svg',
                            pathDisabledSeat:
                                'assets/images/svg_disabled_bus_seat.svg',
                            currentSeatsState: c.seatStates.value,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 100),
              child: ElevatedButton(
                onPressed: () {
                  c.addCard();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffc806),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  minimumSize: Size(Get.width * 0.5, 50),
                ),
                child: const Text('Add New Card'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
