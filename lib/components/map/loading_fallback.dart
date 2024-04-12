import 'package:flutter/material.dart';

class LoadingMapFallback extends StatelessWidget {
  const LoadingMapFallback({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('loading...'),
    );
  }
}
