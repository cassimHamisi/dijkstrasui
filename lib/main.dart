import 'dart:async';

import 'package:dijkstrasui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

FutureOr<void> main() async {
  // To load the .env file contents into dotenv.
  //* NOTE: fileName defaults to .env and can be omitted in this case.
  await dotenv.load(
    //Name of the file to load
    fileName: '.env',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
