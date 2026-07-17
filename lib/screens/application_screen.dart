import 'package:flutter/material.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Application"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Application Form Coming Soon",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}