import 'package:flutter/material.dart';
import 'formData_for_global_store.dart'; // Import your FormData class

class ConstructionPage extends StatelessWidget {
  final FormData formData; // The FormData object

  // Constructor to accept FormData
  const ConstructionPage({super.key, required this.formData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Construction and Structural Characteristics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Form Data:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...formData.inputs.entries.map((entry) {
              return ListTile(
                title: Text('${entry.key}: ${entry.value}'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
