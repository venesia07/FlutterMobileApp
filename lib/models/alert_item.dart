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

