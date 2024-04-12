import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dijkstrasui/constants/backend.dart';

Future<List<String>> calculateShortestPath(
    String startCity, String endCity) async {
  try {
    //Back-end request to calculate the shortest path
    final response = await http.post(Uri.parse(calcPathUri),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"startCity": startCity, "endCity": endCity}));

    //Check the response
    if (response.statusCode == ok) {
      final data = jsonDecode(response.body);
      print('-----------$data');
      return List<String>.from(data['shortestPath']);
    } else {
      throw Exception('Could not calculate the shortest path');
    }
  } catch (e) {
    throw Exception(e);
  }
}

//Function to fetch all the cities
Future<List<Map<String, dynamic>>> fetchAllCities() async {
  try {
    final response = await http.get(
      Uri.parse(fetchCityUri),
    );

    if (response.statusCode == ok) {
      final data = jsonDecode(response.body);
      print(data);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('An error occurred in fetching cities');
    }
  } catch (e) {
    throw Exception(e);
  }
}
