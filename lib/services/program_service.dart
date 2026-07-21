import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program.dart';

class ProgramService {
  Future<List<Program>> loadPrograms() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/programs.json');

    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData.map((item) => Program.fromJson(item)).toList();
  }
}