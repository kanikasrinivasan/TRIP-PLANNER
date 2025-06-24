import 'package:flutter/material.dart';
import 'choose_payment_method_screen.dart';

class BookingDetailsScreen extends StatelessWidget {
final String destination;
final String name;
final String people;
final DateTime date;
final int amount;

const BookingDetailsScreen({
super.key,
required this.destination,
required this.name,
required this.people,
required this.date,
required this.amount,
});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text("Booking Confirmed"), backgroundColor: Colors.orange),
body: Padding(
padding: const EdgeInsets.all(20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text("Your Booking", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
const SizedBox(height: 16),
Text("Destination: $destination"),
Text("Name: $name"),
Text("People: $people"),
Text("Date: ${date.toLocal().toString().split(' ')[0]}"),
Text("Total Amount: ₹$amount", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green)),
const SizedBox(height: 30),
Center(
child: ElevatedButton(
child: const Text("Choose Payment Method"),
onPressed: () {
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => ChoosePaymentMethodScreen(
      destination: destination,
      name: name,
      people: people,
      date: date,
      amount: amount.toDouble(), // convert if stored as int
    ),
  ),
);

},
),
)
],
),
),
);
}
}

