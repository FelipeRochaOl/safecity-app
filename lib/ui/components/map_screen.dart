import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;

    final LatLng center = const LatLng(45.521563, -122.677433);

    void onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 11.0,
      ),
    );
  }
}
