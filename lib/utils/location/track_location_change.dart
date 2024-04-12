import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

//Location update function
void trackLocationChange(Location controller, void Function(LatLng) callback) {
//Function that get triggered on location change
  controller.onLocationChanged.listen((LocationData currentLocation) {
    if (currentLocation.latitude == null) return;
    if (currentLocation.longitude == null) return;

    //pass up-wide
    callback(LatLng(currentLocation.latitude!, currentLocation.longitude!));
  });
}
