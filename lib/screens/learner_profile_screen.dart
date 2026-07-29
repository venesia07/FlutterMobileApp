import 'package:flutter/material.dart';

import '../../widgets/bottom_nav_bar.dart';

import '../../services/saved_program_service.dart';

import '../../services/application_service.dart';

import '../../services/review_service.dart';
import '../../services/alert_service.dart';

class LearnerProfileScreen extends StatelessWidget {
  const LearnerProfileScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Log Out"),
        content: const Text(
          "Are you sure you want to log out?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Log Out"),
          ),
        ],
      ),
    );

    if (confirm == true) {

      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/login",
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Excelerate Learner",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "learner@excelerate.co.za",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.person_outline,
                      color: Colors.red,
                    ),
                    title: const Text("Full Name"),
                    subtitle: const Text("Excelerate Learner"),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(
                      Icons.email_outlined,
                      color: Colors.red,
                    ),
                    title: const Text("Email"),
                    subtitle: const Text(
                      "learner@excelerate.co.za",
                    ),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(
                      Icons.phone_outlined,
                      color: Colors.red,
                    ),
                    title: const Text("Phone"),
                    subtitle: const Text("+27 12 345 6789"),
                  ),

                                  ],
              ),
            ),

            const SizedBox(height: 20),

            Card(
  elevation: 2,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [

        Expanded(
          child: _buildStatTile(
            context,
            "Applications",
            ApplicationService.instance
            .applications
            .length
            .toString(),
            Icons.work_outline,
            Colors.blue,
            () {
              Navigator.pushNamed(
                context,
                "/myApplications",
              );
            },
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _buildStatTile(
            context,
            "Saved",
            SavedProgramService.instance
                .savedPrograms
                .length
                .toString(),
            Icons.favorite,
            Colors.red,
            () {
              Navigator.pushNamed(
                context,
                "/savedPrograms",
              );
            },
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _buildStatTile(
            context,
            "Reviews",
            ReviewService.instance
            .reviews
            .length
            .toString(), // Will become dynamic later
            Icons.star,
            Colors.orange,
            () {
              Navigator.pushNamed(
                context,
                "/myReviews",
              );
            },
          ),
        ),

      ],
    ),
  ),
),

Card(
  elevation: 2,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  child: Column(
    children: [
      ListTile(
        leading: const Icon(
          Icons.person_outline,
          color: Colors.red,
        ),
        title: const Text("Edit Profile"),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
  final nameController = TextEditingController(
    text: "Excelerate Learner",
  );

  final emailController = TextEditingController(
    text: "learner@excelerate.co.za",
  );

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Edit Profile"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Full Name",
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: "Email",
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Profile updated successfully."),
              ),
            );
          },
          child: const Text("Save"),
        ),
      ],
    ),
  );
},
      ),

      const Divider(height: 1),

      ListTile(
       leading: Stack(
  clipBehavior: Clip.none,
  children: [
    const Icon(
      Icons.notifications_outlined,
      color: Colors.red,
    ),

    if (AlertService.instance.unreadCount > 0)
      Positioned(
        right: -6,
        top: -6,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          constraints: const BoxConstraints(
            minWidth: 18,
            minHeight: 18,
          ),
          child: Text(
            AlertService.instance.unreadCount.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
  ],
),
        title: const Text("Notifications"),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pushNamed(context, "/alerts");
        },
      ),

      const Divider(height: 1),

      
      ListTile(
        leading: const Icon(
          Icons.settings_outlined,
          color: Colors.red,
        ),
        title: const Text("Settings"),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Settings"),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.palette),
            title: Text("Theme"),
            subtitle: Text("Light"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Language"),
            subtitle: Text("English"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("App Version"),
            subtitle: Text("v1.0.0"),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: Navigator.of(context).pop,
          child: const Text("Close"),
        ),
      ],
    ),
  );
},
      ),

      const Divider(height: 1),

      ListTile(
        leading: const Icon(
          Icons.help_outline,
          color: Colors.red,
        ),
        title: const Text("Help & Support"),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Contact Support"),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Need assistance?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text("📧 support@excelerate.co.za"),
          SizedBox(height: 8),
          Text("📞 +27 12 345 6789"),
          SizedBox(height: 8),
          Text("🕒 Monday - Friday\n08:00 - 17:00"),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: Navigator.of(context).pop,
          child: const Text("Close"),
        ),
      ],
    ),
  );
},
      ),

      const Divider(height: 1),

      ListTile(
        leading: const Icon(
          Icons.info_outline,
          color: Colors.red,
        ),
        title: const Text("About Excelerate"),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pushNamed(context, "/aboutUs");
        },
      ),
    ],
  ),
),


            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _logout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.logout),
                label: const Text(
                  "Log Out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),



      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(
                context,
                "/home",
              );
              break;

            case 1:
              Navigator.pushReplacementNamed(
                context,
                "/programs",
              );
              break;

            case 2:
              break;
          }
        },
      ),
    );
  }

  Widget _buildStatTile(
  BuildContext context,
  String title,
  String value,
  IconData icon,
  Color color,
  VoidCallback onTap,
) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Column(
      children: [

        Icon(
          icon,
          color: color,
          size: 30,
        ),

        const SizedBox(height: 8),

        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),

      ],
    ),
  );
}
}