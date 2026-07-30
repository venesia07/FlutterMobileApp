import '../models/program.dart';

class SavedProgramService {
  SavedProgramService._();

  static final SavedProgramService instance =
      SavedProgramService._();

  final List<Program> _savedPrograms = [];

  List<Program> get savedPrograms => _savedPrograms;

  bool isSaved(Program program) {
    return _savedPrograms.any(
      (p) => p.title == program.title,
    );
  }

  void saveProgram(Program program) {
    if (!isSaved(program)) {
      _savedPrograms.add(program);
    }
  }

  void removeProgram(Program program) {
    _savedPrograms.removeWhere(
      (p) => p.title == program.title,
    );
  }

  void toggleProgram(Program program) {
    if (isSaved(program)) {
      removeProgram(program);
    } else {
      saveProgram(program);
    }
  }
}