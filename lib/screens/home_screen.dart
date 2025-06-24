import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import 'trip_details_screen.dart';

class HomeScreen extends StatelessWidget {
  static const List<Map<String, String>> trips = [
    {'name': 'Bali', 'image': 'assets/images/bali.jpg'},
    {'name': 'Paris', 'image': 'assets/images/paris.jpg'},
    {'name': 'Tokyo', 'image': 'assets/images/tokyo.jpg'},
    {'name': 'switzerland', 'image': 'assets/images/switzerland.jpg'},
    {'name': 'china', 'image': 'assets/images/china.jpg'},
    {'name': 'japan', 'image': 'assets/images/japan.jpg'},
    {'name': 'india', 'image': 'assets/images/india.jpg'},
    {'name': 'maldives', 'image': 'assets/images/maldives.jpg'},


  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text("My Trips")),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  trip['image']!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(trip['name']!),
              subtitle: const Text("Tap to view packages"),
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => TripDetailsScreen(destination: trip['name']!),
              )),
            ),
          );
        },
      ),
    );
  }
}
