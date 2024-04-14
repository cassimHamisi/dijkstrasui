import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Environment {
  static String get apiUrl {
    return dotenv.get("API_URL", fallback: "No API)URL found");
  }

  static String get getGoogleKey {
    return dotenv.get("GOOGLE_KEY", fallback: "Google key not found");
  }

  static const LatLng pWorldObservatory =
      LatLng(40.712743, -74.013379); //One World observatory
  //Get the default hard coded locations
  static const LatLng pCentralPark =
      LatLng(40.782865, -73.965355); //Central Park
}
