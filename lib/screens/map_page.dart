import 'package:dijkstrasui/utils/location/get_location_updates.dart';
import 'package:dijkstrasui/components/map/google_map.dart';
import 'package:dijkstrasui/components/map/loading_fallback.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    getLocationNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPosition == null
          ? const LoadingMapFallback()
          : GoogleWindow(currentPosition: _currentPosition!),
    );
  }

  Future<void> getLocationNews() async {
    //Get the changing locations
    await getLocationUpdates(_locationController, (position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }
}
