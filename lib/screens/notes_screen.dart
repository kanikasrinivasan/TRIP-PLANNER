import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final List<String> notes = [];
  final TextEditingController controller = TextEditingController();

  void addNote() {
    setState(() {
      notes.add(controller.text);
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Notes")),
      body: Column(
        children: [
          TextField(controller: controller, decoration: const InputDecoration(hintText: "Enter note")),
          ElevatedButton(onPressed: addNote, child: const Text("Add")),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (_, i) => ListTile(title: Text(notes[i])),
            ),
          ),
        ],
      ),
    );
  }
}
