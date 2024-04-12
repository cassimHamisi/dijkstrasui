import 'package:dijkstrasui/utils/location/track_location_change.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

Future<void> getLocationUpdates(
    Location controller, void Function(LatLng) callback) async {
  bool serviceEnabled;
  PermissionStatus permissionGranted;

  //Check if the GPS services is available in the device
  serviceEnabled = await controller.serviceEnabled();

  //No GPS in the users phone
  if (!serviceEnabled) {
    return;
  }

  //Request user to activate location service
  serviceEnabled = await controller.requestService();

  //Check if we have access to the users location
  permissionGranted = await controller.hasPermission();

  //There is no permission request a new permission
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await controller.requestPermission();

    //Permission denied by the user
    if (permissionGranted == PermissionStatus.denied) {
      return; //NOTHING WE CAN DO
    }
  }

  //Track the location change
  trackLocationChange(controller, callback);
}
