class Program {
  final int id;
  final String title;
  final String description;
  final String date;
  final String duration;
  final String mode;
  final String status;
  final String imageUrl;
  final String instructor;
  final int spots;
  final int registered;

  Program({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.duration,
    required this.mode,
    required this.status,
    required this.imageUrl,
    required this.instructor,
    required this.spots,
    required this.registered,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      duration: json['duration'],
      mode: json['mode'],
      status: json['status'],
      imageUrl: json['imageUrl'],
      instructor: json['instructor'],
      spots: json['spots'],
      registered: json['registered'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'duration': duration,
      'mode': mode,
      'status': status,
      'imageUrl': imageUrl,
      'instructor': instructor,
      'spots': spots,
      'registered': registered,
    };
  }
}
