import 'package:flutter/material.dart';

class AlertItem {
  final String title;
  final String message;
  final DateTime date;
  bool isRead;

  AlertItem({
    required this.title,
    required this.message,
    required this.date,
    this.isRead = false,
  });
}

class AlertService extends ChangeNotifier {
  AlertService._();

  static final AlertService instance = AlertService._();

  final List<AlertItem> _alerts = [];

  List<AlertItem> get alerts => _alerts;

  int get unreadCount =>
      _alerts.where((a) => !a.isRead).length;

  void addAlert({
    required String title,
    required String message,
  }) {
    _alerts.insert(
      0,
      AlertItem(
        title: title,
        message: message,
        date: DateTime.now(),
      ),
    );

    notifyListeners();
  }

  void markAllAsRead() {
    for (final alert in _alerts) {
      alert.isRead = true;
    }

    notifyListeners();
  }

  void clearAlerts() {
    _alerts.clear();
    notifyListeners();
  }
}
