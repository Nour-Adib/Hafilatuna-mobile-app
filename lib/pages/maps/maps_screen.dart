import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hafilatuna/pages/maps/maps_controller.dart';
import 'package:hafilatuna/widgets/navbar/navbar.dart';
import 'package:hafilatuna/widgets/navbar/navbar_controller.dart';
import 'package:hafilatuna/widgets/top_bar.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapController c = Get.put(MapController());
    final NavbarController navbarController = Get.put(NavbarController());

    return Scaffold(
        appBar: const TopBar(
          pageTile: 'Maps',
        ),
        bottomNavigationBar: Obx(() => Navbar(
            currentIndex: navbarController.selectedIndex.value,
            onItemTap: navbarController.onItemTap)),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: c.kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            c.initializeMap(controller);
          },
        ));
  }
}
