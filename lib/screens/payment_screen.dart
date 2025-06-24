import 'package:flutter/material.dart';
import 'payment_success_screen.dart'; // 👈 Create this screen separately

class PaymentScreen extends StatefulWidget {
  final String destination;
  final String name;
  final String people;
  final DateTime date;
  final double amount;
  final String method;

  const PaymentScreen({
    super.key,
    required this.destination,
    required this.name,
    required this.people,
    required this.date,
    required this.amount,
    required this.method,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late String selectedMethod;

  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  final nameOnCardController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedMethod = widget.method;
  }

  Widget buildCardForm() {
    return Column(
      children: [
        TextField(
          controller: cardNumberController,
          decoration: const InputDecoration(
            labelText: "Card Number",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: expiryController,
                decoration: const InputDecoration(
                  labelText: "Expiry",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: cvvController,
                decoration: const InputDecoration(
                  labelText: "CVV",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextField(
          controller: nameOnCardController,
          decoration: const InputDecoration(
            labelText: "Name on Card",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Confirmation"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trip to ${widget.destination}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Amount to Pay: ₹${widget.amount.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 20),
            Text(
              "Payment Method: ${widget.method}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            if (selectedMethod == 'Card') buildCardForm(),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.payment),
                label: const Text("Confirm Payment", style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentSuccessScreen(
                        destination: widget.destination,
                        date: widget.date,
                        method: selectedMethod,
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
