import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Profile")),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            SizedBox(height: 20),
            Text("User Name: Kanika", style: TextStyle(fontSize: 18)),
            Text("Email: kanika@example.com", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
