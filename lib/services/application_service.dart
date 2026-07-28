import '../models/program.dart';

class ApplicationService {
  ApplicationService._();

  static final ApplicationService instance =
      ApplicationService._();

  final List<Program> _applications = [];

  List<Program> get applications => _applications;

  void applyForProgram(Program program) {
    if (!_applications.any((p) => p.title == program.title)) {
      _applications.add(program);
    }
  }

  bool hasApplied(Program program) {
    return _applications.any(
      (p) => p.title == program.title,
    );
  }
}