import 'package:dijkstrasui/screens/image_screen.dart';
import 'package:dijkstrasui/screens/map_page.dart';
import 'package:dijkstrasui/screens/screen_list.dart';
import 'package:dijkstrasui/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const CityListScreen(),
    const ImageScreen(),
    const MapPage(),
    const SettingsPage(),
  ];
  final List<Text> _title = [
    const Text("Home"),
    const Text("Places"),
    const Text("Map"),
    const Text("Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        title: _title[_selectedIndex],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14),
          child: GNav(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            color: Theme.of(context).colorScheme.tertiary,
            activeColor: Theme.of(context).colorScheme.primary,
            tabBackgroundColor: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.all(14),
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.image,
                text: "Route",
              ),
              GButton(
                icon: Icons.map,
                text: "Map",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
