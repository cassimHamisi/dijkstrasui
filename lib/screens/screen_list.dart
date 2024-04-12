import 'package:dijkstrasui/utils/calculate_path_button.dart';
import 'package:dijkstrasui/utils/fetch_data.dart';
import 'package:flutter/material.dart';

class CityListScreen extends StatefulWidget {
  const CityListScreen({super.key});

  @override
  State<CityListScreen> createState() => _CityListScreenState();
}

class _CityListScreenState extends State<CityListScreen> {
  //list of all the cities
  List<Map<String, dynamic>>? cities = [];

  //Shortest path set
  Set<String> shortestPathSet = {};

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

//Set all the cities to up-wide stat
  Future<void> _loadCities() async {
    try {
      final loadedCities = await fetchAllCities();
      setState(() {
        cities = loadedCities;
      });
      print('Loaded cities $loadedCities');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  //Get the shortest path from loaded cities
  Future<void> _calcShortestPath(String startCity, String endCity) async {
    try {
      final path = await calculateShortestPath(startCity, endCity);
      print('------------------The shortest path : $path');

      // setState(() {
      //   shortestPathSet = Set.from(path);
      // });
    } catch (error) {
      print('Error occurred: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: cities != null
            ? Padding(
                padding: const EdgeInsets.all(28.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CalculatePathButton(calculateFunction: _calcShortestPath)
                    ],
                  ),
                ),
              )
            : const CircularProgressIndicator());
  }
}
