import 'dart:async';

import 'package:dijkstrasui/models/environment.dart';
import 'package:dijkstrasui/utils/location/get_location_updates.dart';
import 'package:dijkstrasui/components/map/google_map.dart';
import 'package:dijkstrasui/components/map/loading_fallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _locationController = Location();

  LatLng? _currentPosition;
  //Make sure the user is always in focus when navigating though a map
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  //Map of polygon id and polyLines
  Map<PolylineId, Polyline> polyLines = {};

  @override
  void initState() {
    super.initState();
    (() async {
      await getLocationNews();
      final coordinates = await getPolyLinePoints();
      generatePolyLineFromPoints(coordinates);
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPosition == null
          ? const LoadingMapFallback()
          : GoogleWindow(
              currentPosition: _currentPosition!,
              mapController: _mapController,
              polyLines: polyLines,
            ),
    );
  }

  Future<void> _cameraToPosition(LatLng position) async {
    //Get hold of the google map controller
    final controller = await _mapController.future;

    //Set the new camera position
    CameraPosition newCameraPosition =
        CameraPosition(target: position, zoom: 13);

    //Animate the camera to the new camera position
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  Future<void> getLocationNews() async {
    //Get the changing locations
    await getLocationUpdates(_locationController, (position) {
      setState(() {
        _currentPosition = position;
        _cameraToPosition(_currentPosition!);
      });
    });
  }

  //Use directions api and get information from it
  Future<List<LatLng>> getPolyLinePoints() async {
    //Store the coordinates
    List<LatLng> polylineCoodinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Environment.getGoogleKey,
      PointLatLng(Environment.pWorldObservatory.latitude,
          Environment.pWorldObservatory.longitude),
      PointLatLng(Environment.pCentralPark.latitude,
          Environment.pCentralPark.longitude),
      travelMode: TravelMode.driving,
    );
    //add the polyline points to the result
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoodinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }
    return polylineCoodinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId('polyId');
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);

    //Set the polyline to the map above
    setState(() {
      polyLines[id] = polyline;
    });
  }
}
