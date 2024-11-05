import 'package:flutter/material.dart';
import 'seismicity_form.dart';
import 'formData_for_global_store.dart'; // Import FormData

void main() {
  setupLogging(); // Set up logging

  // Optionally, clear FormData when the app starts
  FormData().clear();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Building Info Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SeismicityForm(),
    );
  }
}
