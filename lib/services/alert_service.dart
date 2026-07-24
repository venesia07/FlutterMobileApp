import '../models/alert_item.dart';

/// Clean Architecture Service providing Alert and Notification operations.
/// Designed for easy future extension with REST API or Push Notifications (FCM).
class AlertService {
  final List<AlertItem> _alerts = [];

  /// Fetches available alerts asynchronously.
  Future<List<AlertItem>> fetchAlerts() async {
    // Simulate network delay for clean async architecture
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_alerts);
  }

  /// Marks a specific alert as read.
  Future<void> markAsRead(String id) async {
    final index = _alerts.indexWhere((alert) => alert.id == id);
    if (index != -1) {
      _alerts[index] = _alerts[index].copyWith(isRead: true);
    }
  }

  /// Marks all alerts as read.
  Future<void> markAllAsRead() async {
    for (int i = 0; i < _alerts.length; i++) {
      _alerts[i] = _alerts[i].copyWith(isRead: true);
    }
  }

  /// Adds a new alert (e.g., received via FCM or admin broadcast).
  void addAlert(AlertItem alert) {
    _alerts.insert(0, alert);
  }

  /// Clears all alerts.
  void clearAlerts() {
    _alerts.clear();
  }
}
