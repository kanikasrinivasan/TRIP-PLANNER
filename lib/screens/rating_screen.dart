import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 0;

  void _submitRating() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You rated: $_rating stars")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rate This App")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text("How would you rate this app?", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 40),
            Slider(
              value: _rating,
              onChanged: (newRating) => setState(() => _rating = newRating),
              min: 0,
              max: 5,
              divisions: 5,
              label: "${_rating.round()}",
            ),
            Text("Your rating: ${_rating.toStringAsFixed(1)}"),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _submitRating, child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
