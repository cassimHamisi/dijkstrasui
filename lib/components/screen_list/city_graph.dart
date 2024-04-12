import 'package:dijkstrasui/components/screen_list/city_card.dart';
import 'package:flutter/material.dart';

class CityGraph extends StatelessWidget {
  final List<String> cityNames;
  final List<String> shortestPathSet;
  const CityGraph(this.cityNames, this.shortestPathSet, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: cityNames.length,
      itemBuilder: (context, index) {
        final cityName = cityNames[index];
        final isShortestPath = shortestPathSet.contains(cityName);
        return CityCard(cityName: cityName, isShortestPath: isShortestPath);
      },
    );
  }
}
