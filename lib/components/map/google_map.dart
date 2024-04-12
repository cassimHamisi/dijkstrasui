import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleWindow extends StatelessWidget {
  final LatLng currentPosition;
  const GoogleWindow({super.key, required this.currentPosition});

  //Get the default hard coded locations
  static const LatLng _pGooglePlex =
      LatLng(37.446950, -122.121120); //Bay shore fwy
  static const LatLng _pApplePark =
      LatLng(37.410986369008754, -122.0715872286749); //Silicon valley

  @override
  Widget build(BuildContext context) {
    print('This is the current postiion $currentPosition');
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: currentPosition, zoom: 15),
      markers: {
        Marker(
          markerId: const MarkerId("_currentLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: currentPosition,
        ),
        const Marker(
          markerId: MarkerId("_sourceLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _pGooglePlex,
        ),
        const Marker(
          markerId: MarkerId("_destinationLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _pApplePark,
        ),
      },
    );
  }
}
