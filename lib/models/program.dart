class Program {
  final String title;
  final String startDate;
  final String endDate;
  final String location;
  final String description;
  final List<String> requirements;
  final List<String> skills;
  final String image;

  Program({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.description,
    required this.requirements,
    required this.skills,
    required this.image,
  });

  // Factory method to create Program from JSON
  factory Program.fromJson(Map<String, dynamic> json) {
    // Get category if it exists (since your JSON uses 'category' instead of 'skills')
    String? category = json['category'] as String?;

    // If skills is empty but category exists, use category
    List<String> skillsList = [];
    if (json['skills'] != null) {
      if (json['skills'] is String) {
        skillsList = [json['skills']];
      } else if (json['skills'] is List) {
        skillsList = List<String>.from(json['skills']);
      }
    } else if (category != null && category.isNotEmpty) {
      skillsList = [category];
    }

    return Program(
      title: json['title']?.toString() ?? 'Untitled',
      startDate: json['startDate']?.toString() ?? 'TBD',
      endDate: json['endDate']?.toString() ?? 'TBD',
      location: json['location']?.toString() ?? 'Unknown',
      description:
          json['description']?.toString() ?? 'No description available',
      requirements: json['requirements'] != null
          ? (json['requirements'] is String
                ? [json['requirements']]
                : List<String>.from(json['requirements']))
          : [],
      skills: skillsList,
      image: json['image']?.toString() ?? '',
    );
  }

  // Convert Program to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'startDate': startDate,
      'endDate': endDate,
      'location': location,
      'description': description,
      'requirements': requirements,
      'skills': skills,
      'image': image,
    };
  }
}
