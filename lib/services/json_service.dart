import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program.dart';

class JsonService {
  static const String _programsPath = 'assets/data/programs.json';
  static const String _usersPath = 'assets/data/users.json';

  // Load programs from JSON file
  static Future<List<Program>> loadPrograms() async {
    try {
      final String jsonString = await rootBundle.loadString(_programsPath);
      print('✅ JSON loaded successfully');

      // Parse the JSON
      final decoded = json.decode(jsonString);

      // Handle both array and object formats
      List<dynamic> programsJson;
      if (decoded is List) {
        // If it's already a list, use it directly
        programsJson = decoded;
        print('📄 JSON is an array with ${programsJson.length} items');
      } else if (decoded is Map<String, dynamic> &&
          decoded.containsKey('programs')) {
        // If it's an object with a 'programs' key
        programsJson = decoded['programs'];
        print('📄 JSON is an object with ${programsJson.length} programs');
      } else {
        throw Exception('Unknown JSON format');
      }

      if (programsJson.isEmpty) {
        print('⚠️ No programs found in JSON');
        return [];
      }

      final programs = programsJson.map((json) {
        print('📄 Processing: ${json['title'] ?? 'Untitled'}');
        return Program.fromJson(json);
      }).toList();

      print('✅ Successfully loaded ${programs.length} programs');
      return programs;
    } catch (e) {
      print('❌ Error loading programs: $e');
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
