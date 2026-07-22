import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program_model.dart';

class JsonService {
  static const String _programsPath = 'assets/data/programs.json';
  static const String _usersPath = 'assets/data/users.json';

  // Load programs from JSON file
  static Future<List<Program>> loadPrograms() async {
    try {
      final String jsonString = await rootBundle.loadString(_programsPath);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> programsJson = jsonData['programs'];
      return programsJson.map((json) => Program.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load programs: ${e.toString()}');
    }
  }

  // Load users from JSON file
  static Future<Map<String, dynamic>> loadUsers() async {
    try {
      final String jsonString = await rootBundle.loadString(_usersPath);
      return json.decode(jsonString);
    } catch (e) {
      throw Exception('Failed to load users: ${e.toString()}');
    }
  }
}
