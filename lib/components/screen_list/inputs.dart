import 'package:dijkstrasui/components/screen_list/city_graph.dart';
import 'package:dijkstrasui/utils/fetch_data.dart';
import 'package:flutter/material.dart';

class CityRowInput extends StatefulWidget {
  final Future<void> Function(String, String) calculateFunction;
  const CityRowInput({super.key, required this.calculateFunction});

  @override
  State<CityRowInput> createState() => _CityRowInputState();
}

class _CityRowInputState extends State<CityRowInput> {
  List<String> shortestPath = [];

  List<Map<String, dynamic>>? cities = [];

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

  @override
  Widget build(BuildContext context) {
    TextEditingController startCityController = TextEditingController();
    TextEditingController endCityController = TextEditingController();
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: startCityController,
                decoration: const InputDecoration(labelText: 'Start City'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: endCityController,
                decoration: const InputDecoration(labelText: 'End City'),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        ElevatedButton(
          onPressed: () async {
            try {
              final path = await calculateShortestPath(
                  startCityController.text, endCityController.text);
              setState(() {
                shortestPath = path;
              });
            } catch (error) {
              print('Error occured: $error');
            }
          },
          child: const Text('Calculate the shortest path'),
        ),
        shortestPath.isNotEmpty
            ? Text('Shortest path : ${shortestPath.join("->")}')
            : const SizedBox.shrink(),
        Flexible(
          child: CityGraph(
              cities!.map((city) => city['name'] as String).toList(),
              shortestPath),
        )
      ],
    );
  }
}
