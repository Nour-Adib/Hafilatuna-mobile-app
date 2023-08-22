import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  initializeMap(GoogleMapController controller) {
    try {
      mapController.complete(controller);
    // ignore: empty_catches
    } catch (e) {
    }
  }
}
