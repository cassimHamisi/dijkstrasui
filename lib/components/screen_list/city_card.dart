import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String cityName;
  final bool isShortestPath;
  const CityCard(
      {super.key, required this.cityName, required this.isShortestPath});

  @override
  Widget build(BuildContext context) {
    final cardColor = isShortestPath ? Colors.green : Colors.amberAccent;
    return Card(
      color: cardColor,
      child: ListTile(
        title: Text(
          cityName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
