class Program {
  final int id;
  final String title;
  final String startDate;
  final String endDate;
  final String deliveryMethod;
  final String location;
  final String category;
  final String description;
  final List<String> requirements;
  final List<String> skills;
  final String image;

  Program({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.deliveryMethod,
    required this.location,
    required this.category,
    required this.description,
    required this.requirements,
    required this.skills,
    required this.image,
  });

// Factory method to create Program from JSON
factory Program.fromJson(Map<String, dynamic> json) {
  String? category = json['category'] as String?;

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
    id: json['id'] ?? 0,
    title: json['title']?.toString() ?? 'Untitled',
    startDate: json['startDate']?.toString() ?? 'TBD',
    endDate: json['endDate']?.toString() ?? 'TBD',
    deliveryMethod: json['deliveryMethod'].toString() ?? 'Unknown',
    location: json['location']?.toString() ?? 'Unknown',
    category: category ?? '',
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
    'id': id,
    'title': title,
    'startDate': startDate,
    'endDate': endDate,
    'location': location,
    'category': category,
    'description': description,
    'requirements': requirements,
    'skills': skills,
    'image': image,
  };
}
}