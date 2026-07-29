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

                );
              },
            ),
    );
  }
}

