import 'dart:async';

import 'package:dijkstrasui/models/environment.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleWindow extends StatelessWidget {
  final LatLng currentPosition;
  final Completer<GoogleMapController> mapController;
  //Map of polygon id and polyLines
  final Map<PolylineId, Polyline> polyLines;
  const GoogleWindow({
    super.key,
    required this.currentPosition,
    required this.mapController,
    required this.polyLines,
  });

  @override
  @override
  Widget build(BuildContext context) {
    print(
        'This is the current postiion -----------------------------$currentPosition');
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: currentPosition, zoom: 13),
      onMapCreated: ((controller) => mapController.complete(controller)),
      markers: {
        Marker(
          markerId: const MarkerId("_currentLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: currentPosition,
        ),
        const Marker(
          markerId: MarkerId("_sourceLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: Environment.pWorldObservatory,
        ),
        const Marker(
          markerId: MarkerId("_destinationLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: Environment.pCentralPark,
        ),
      },
      polylines: Set<Polyline>.of(polyLines.values),
    );
  }
}
