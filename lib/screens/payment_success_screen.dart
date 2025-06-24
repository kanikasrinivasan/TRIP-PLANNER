import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final String destination;
  final DateTime date;
  final String method;

  const PaymentSuccessScreen({
    super.key,
    required this.destination,
    required this.date,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Successful"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            Text("Your trip to $destination is confirmed!",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Text("Date: ${date.toLocal().toString().split(' ')[0]}",
                style: const TextStyle(fontSize: 16)),
            Text("Paid via: $method", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
