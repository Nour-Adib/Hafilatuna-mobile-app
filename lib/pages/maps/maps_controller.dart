import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hafilatuna/services/route/route.service.dart';
import 'package:hafilatuna/utility/shared_preferences.dart';

class MapController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  LatLng origin = const LatLng(0, 0);
  LatLng destination = const LatLng(0, 0);
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylines = {};
  Set<Marker> markers = {};
  Marker destinationMarker = const Marker(markerId: MarkerId('destination'));
  Marker startMarker = const Marker(markerId: MarkerId('start'));
  BitmapDescriptor busIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor schoolIcon = BitmapDescriptor.defaultMarker;
  final ImageConfiguration imageConfiguration =
      createLocalImageConfiguration(Get.context!, size: const Size.square(50));
  var isLoading = false.obs;

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  getEnroutInfo(String? ticketId) async {
    toggleLoading();
    final dio = Dio();
    final routeService = RouteSerrvice(dio);

    final accessToken =
        await SharedPreferencesService.getFromShared('accessToken');

    await routeService
        .getRoute('Bearer $accessToken', ticketId!)
        .then((response) async {
      origin = LatLng(
          double.parse(response.pickUpLat!), double.parse(response.pickUpLon!));
      destination = LatLng(double.parse(response.school!.latitude!),
          double.parse(response.school!.longitude!));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/images/school.')
          .then((value) => schoolIcon = value);
      destinationMarker = Marker(
        markerId: const MarkerId('destination'),
        position: destination,
        icon: schoolIcon,
      );
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/images/bus.png')
          .then((value) => busIcon = value);
      startMarker = Marker(
        markerId: const MarkerId('start'),
        position: origin,
        icon: busIcon,
      );
      markers.add(startMarker);
      markers.add(destinationMarker);
      await getPolyline();
      toggleLoading();
    });
  }

  getPolyline() async {
    String apiKey = "AIzaSyBw1JN2UkOW2p6yo2TJPwK2aSjHdwGNVgc";
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        apiKey,
        PointLatLng(origin.latitude, origin.longitude),
        PointLatLng(destination.latitude, destination.longitude),
        travelMode: TravelMode.driving);

    if (result.points.isNotEmpty) {
      for (var _ in result.points) {
        polylines.add(Polyline(
          polylineId: const PolylineId('poly'),
          color: Colors.blue,
          points: result.points
              .map((point) => LatLng(point.latitude, point.longitude))
              .toList(),
        ));
      }
    }
  }

  initializeMap(GoogleMapController controller) {
    try {
      mapController.complete(controller);
      // ignore: empty_catches
    } catch (e) {}
  }

  toggleLoading() {
    isLoading.value = !isLoading.value;
  }
}
