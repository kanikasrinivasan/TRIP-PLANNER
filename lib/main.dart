import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
runApp(const TravelPlannerApp());
}

class TravelPlannerApp extends StatelessWidget {
const TravelPlannerApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Travel Planner',
theme: ThemeData(primarySwatch: Colors.blue),
home: const WelcomeScreen(), // 👈 Start here
debugShowCheckedModeBanner: false,
);
}
}