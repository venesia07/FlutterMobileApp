class AlertItem {
  final String title;
  final String message;
  final DateTime time;
  final bool isRead;

  AlertItem({
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
  });
}

/*class AlertItem {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  final String category; // 'Program', 'System', 'Announcement'
  final bool isRead;

  const AlertItem({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.category,
    this.isRead = false,
  });

  AlertItem copyWith({
    String? id,
    String? title,
    String? message,
    DateTime? timestamp,
    String? category,
    bool? isRead,
  }) {
    return AlertItem(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      category: category ?? this.category,
      isRead: isRead ?? this.isRead,
    );
  }

  factory AlertItem.fromJson(Map<String, dynamic> json) {
    return AlertItem(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? 'Alert',
      message: json['message']?.toString() ?? '',
      timestamp: json['timestamp'] != null
          ? DateTime.tryParse(json['timestamp'].toString()) ?? DateTime.now()
          : DateTime.now(),
      category: json['category']?.toString() ?? 'General',
      isRead: json['isRead'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'category': category,
      'isRead': isRead,
    };
  }
}*/
