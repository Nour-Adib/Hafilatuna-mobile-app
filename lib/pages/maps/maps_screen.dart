import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hafilatuna/pages/maps/maps_controller.dart';
import 'package:hafilatuna/widgets/loading_indicator.dart';
import 'package:hafilatuna/widgets/top_bar.dart';

class MapScreen extends StatelessWidget {
  final String ticketId;
  const MapScreen({required this.ticketId, super.key});

  @override
  Widget build(BuildContext context) {
    final MapController c = Get.put(MapController());
    c.getEnroutInfo(ticketId);

    return Scaffold(
        appBar: const TopBar(
          pageTile: 'Maps',
        ),
        body: SafeArea(
          child: Obx((() => Center(
                child: c.isLoading.value
                    ? const LoadingIndicator()
                    : GoogleMap(
                        onMapCreated: (GoogleMapController controller) {
                          c.initializeMap(controller);
                        },
                        markers: c.markers,
                        polylines: c.polylines,
                        initialCameraPosition:
                            CameraPosition(target: c.origin, zoom: 14),
                      ),
              ))),
        ));
  }
}
