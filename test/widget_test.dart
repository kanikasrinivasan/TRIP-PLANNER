import 'package:flutter/material.dart';
import 'login_screen.dart'; // make sure this file exists

class WelcomeScreen extends StatelessWidget {
const WelcomeScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
body: Stack(
children: [
// Background image
Positioned.fill(
child: Image.asset(
'assets/images/travel.jpg',
fit: BoxFit.cover,
),
),
// Dark overlay
Positioned.fill(
child: Container(
color: Colors.black.withOpacity(0.4),
),
),
// Content
Center(
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 32),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
'Explore The World',
style: TextStyle(
color: Colors.white,
fontSize: 32,
fontWeight: FontWeight.bold,
),
textAlign: TextAlign.center,
),
const SizedBox(height: 16),
const Text(
'Plan and book your dream destinations with ease.',
style: TextStyle(
color: Colors.white70,
fontSize: 18,
),
textAlign: TextAlign.center,
),
const SizedBox(height: 40),
ElevatedButton(
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => const LoginScreen()),
);
},
style: ElevatedButton.styleFrom(
backgroundColor: Colors.orangeAccent,
padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(30),
),
),
child: const Text("Get Started", style: TextStyle(fontSize: 18)),
),
],
),
),
),
],
),
);
}
}

