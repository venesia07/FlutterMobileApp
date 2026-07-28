import 'package:flutter/material.dart';

import '../services/alert_service.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    AlertService.instance.markAllAsRead();

    final alerts =
        AlertService.instance.alerts;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),

      body: alerts.isEmpty

          ? const Center(
              child: Text(
                "No notifications yet.",
              ),
            )

          : ListView.builder(

              itemCount: alerts.length,

              itemBuilder: (context, index) {

                final alert = alerts[index];

                return ListTile(

                  leading: const CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),

                  title: Text(
                    alert.title,
                  ),

                  subtitle: Text(
                    alert.message,
                  ),

                  /*trailing: Text(
                    "${alert.time.hour}:${alert.time.minute.toString().padLeft(2, '0')}",
                  ),*/
                );
              },
            ),
    );
  }
}

/*import 'package:flutter/material.dart';
import '../models/alert_item.dart';
import '../services/alert_service.dart';

class AlertsScreen extends StatefulWidget {
  final AlertService? alertService;

  const AlertsScreen({super.key, this.alertService});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  late final AlertService _alertService;
  List<AlertItem> _alerts = [];
  bool _isLoading = true;
  String _selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _alertService = widget.alertService ?? AlertService();
    _fetchAlerts();
  }

  Future<void> _fetchAlerts() async {
    setState(() => _isLoading = true);
    final alerts = await _alertService.fetchAlerts();
    if (mounted) {
      setState(() {
        _alerts = alerts;
        _isLoading = false;
      });
    }
  }

  List<String> get _categories => ["All", "Programs", "System", "Announcements"];

  List<AlertItem> get _filteredAlerts {
    if (_selectedCategory == "All") return _alerts;
    return _alerts.where((a) => a.category.toLowerCase() == _selectedCategory.toLowerCase()).toList();
  }

  Future<void> _markAllAsRead() async {
    await _alertService.markAllAsRead();
    await _fetchAlerts();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All alerts marked as read")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Alerts & Notifications"),
        centerTitle: true,
        elevation: 0,
        actions: [
          if (_alerts.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.done_all),
              tooltip: "Mark all as read",
              onPressed: _markAllAsRead,
            ),
        ],
      ),
      body: Column(
        children: [
          _buildCategoryFilter(),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: _fetchAlerts,
                    child: _filteredAlerts.isEmpty ? _buildEmptyState() : _buildAlertList(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: SizedBox(
        height: 36,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          separatorBuilder: (_, _) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final category = _categories[index];
            final isSelected = category == _selectedCategory;
            return ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() => _selectedCategory = category);
                }
              },
              selectedColor: Colors.red.shade100,
              labelStyle: TextStyle(
                color: isSelected ? Colors.red.shade700 : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              backgroundColor: Colors.grey.shade200,
              side: BorderSide(
                color: isSelected ? Colors.red.shade300 : Colors.transparent,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.notifications_off_outlined,
                  size: 64,
                  color: Colors.red.shade400,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "No Alerts Available",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "You're all caught up! New program announcements, application status updates, and reminders will appear here.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 32),
              OutlinedButton.icon(
                onPressed: _fetchAlerts,
                icon: const Icon(Icons.refresh),
                label: const Text("Check for Updates"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade700,
                  side: BorderSide(color: Colors.red.shade300),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAlertList() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: _filteredAlerts.length,
      itemBuilder: (context, index) {
        final alert = _filteredAlerts[index];
        return _AlertTile(
          alert: alert,
          onTap: () async {
            if (!alert.isRead) {
              await _alertService.markAsRead(alert.id);
              await _fetchAlerts();
            }
          },
        );
      },
    );
  }
}

class _AlertTile extends StatelessWidget {
  final AlertItem alert;
  final VoidCallback onTap;

  const _AlertTile({
    required this.alert,
    required this.onTap,
  });

  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'program':
        return Icons.school;
      case 'system':
        return Icons.settings;
      case 'announcement':
        return Icons.campaign;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: alert.isRead ? 1 : 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: alert.isRead
            ? BorderSide.none
            : BorderSide(color: Colors.red.shade200, width: 1),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: alert.isRead
                    ? Colors.grey.shade200
                    : Colors.red.shade100,
                child: Icon(
                  _getIconForCategory(alert.category),
                  color: alert.isRead ? Colors.grey : Colors.red.shade700,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            alert.title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: alert.isRead
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        if (!alert.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.red.shade600,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      alert.message,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _formatTimestamp(alert.timestamp),
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}*/
