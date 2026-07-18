import 'package:flutter/material.dart';
import 'screens/program_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excelerate App',
      home: ProgramListScreen(),
    );
  }
}