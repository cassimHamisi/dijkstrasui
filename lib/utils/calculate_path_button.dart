import 'package:dijkstrasui/components/screen_list/inputs.dart';
import 'package:flutter/material.dart';

class CalculatePathButton extends StatelessWidget {
  final Future<void> Function(String, String) calculateFunction;
  const CalculatePathButton({super.key, required this.calculateFunction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: SizedBox(
        child: CityRowInput(calculateFunction: calculateFunction),
      ),
    );
  }
}
