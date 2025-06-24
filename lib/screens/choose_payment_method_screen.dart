import 'package:flutter/material.dart';
import 'payment_screen.dart';

class ChoosePaymentMethodScreen extends StatelessWidget {
  final String destination;
  final String name;
  final String people;
  final DateTime date;
  final double amount;

  const ChoosePaymentMethodScreen({
    super.key,
    required this.destination,
    required this.name,
    required this.people,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final methods = ['GPay', 'PhonePe', 'Paytm', 'Card'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Payment Method"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: methods.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(_getIcon(methods[index]), size: 32),
            title: Text(methods[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(
                    destination: destination,
                    name: name,
                    people: people,
                    date: date,
                    amount: amount,
                    method: methods[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  IconData _getIcon(String method) {
    switch (method) {
      case 'GPay':
        return Icons.account_balance_wallet;
      case 'PhonePe':
        return Icons.phone_android;
      case 'Paytm':
        return Icons.payment;
      default:
        return Icons.credit_card;
    }
  }
}
