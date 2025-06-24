import 'package:flutter/material.dart';
import 'booking_details_screen.dart';

class BookingScreen extends StatefulWidget {
  final String destination;

  const BookingScreen({super.key, required this.destination});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final nameController = TextEditingController();
  final peopleController = TextEditingController();
  DateTime? selectedDate;

  void _submitBooking() {
    if (nameController.text.isEmpty ||
        peopleController.text.isEmpty ||
        selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    int peopleCount = int.tryParse(peopleController.text) ?? 1;
    int pricePerPerson = 0;

    switch (widget.destination.toLowerCase()) {
      case 'bali':
      case 'maldives':
        pricePerPerson = 20000;
        break;
      case 'paris':
        pricePerPerson = 30000;
        break;
      case 'new york':
        pricePerPerson = 25000;
        break;
      default:
        pricePerPerson = 15000;
    }

    int totalAmount = pricePerPerson * peopleCount;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BookingDetailsScreen(
          destination: widget.destination,
          name: nameController.text,
          people: peopleController.text,
          date: selectedDate!,
          amount: totalAmount,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Trip to ${widget.destination}"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Your Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: peopleController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "No. of People"),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(selectedDate == null
                      ? "Select Travel Date"
                      : "Date: ${selectedDate!.toLocal().toString().split(' ')[0]}"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(const Duration(days: 1)),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                      });
                    }
                  },
                  child: const Text("Choose Date"),
                )
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitBooking,
              child: const Text("Book Now"),
            )
          ],
        ),
      ),
    );
  }
}
