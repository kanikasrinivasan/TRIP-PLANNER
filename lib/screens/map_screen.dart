import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  // NOTE: Integrate Google Maps later with `google_maps_flutter` plugin
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map")),
      body: const Center(child: Text("Google Maps Placeholder")),
    );
  }
}
