import 'package:flutter/material.dart';

class PaymentConfirmationScreen extends StatelessWidget {
final String method;
final int amount;

const PaymentConfirmationScreen({
super.key,
required this.method,
required this.amount,
});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text("Payment Confirmation"), backgroundColor: Colors.green),
body: Center(
child: Padding(
padding: const EdgeInsets.all(24),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
const SizedBox(height: 20),
Text("Payment Successful", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
const SizedBox(height: 10),
Text("Method: $method", style: TextStyle(fontSize: 18)),
Text("Amount Paid: ₹$amount", style: TextStyle(fontSize: 18, color: Colors.green)),
const SizedBox(height: 30),
ElevatedButton(
onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
child: const Text("Finish"),
)
],
),
),
),
);
}
}