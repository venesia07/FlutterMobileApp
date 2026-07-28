import 'package:flutter/material.dart';

import '../services/application_service.dart';
import 'program_details_screen.dart';

class MyApplicationsScreen extends StatelessWidget {
  const MyApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final applications =
        ApplicationService.instance.applications;

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Applications"),
        centerTitle: true,
      ),

      body: applications.isEmpty

          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    const Icon(
                      Icons.work_outline,
                      size: 90,
                      color: Colors.grey,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "No applications yet",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Apply for a program and\nit will appear here.",
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 25),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/programs",
                        );
                      },
                      child: const Text(
                        "Browse Programs",
                      ),
                    ),

                  ],
                ),
              ),
            )

          : ListView.builder(

              padding:
                  const EdgeInsets.all(16),

              itemCount:
                  applications.length,

              itemBuilder:
                  (context, index) {

                final program =
                    applications[index];

                return Card(

                  child: ListTile(

                    leading: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(
                        8,
                      ),
                      child: Image.asset(
                        program.image,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),

                    title: Text(
                      program.title,
                    ),

                    subtitle: Text(
                      program.category,
                    ),

                    trailing:
                        const Icon(
                      Icons.chevron_right,
                    ),

                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProgramDetailsScreen(
                            program: program,
                          ),
                        ),
                      );

                    },

                  ),
                );
              },
            ),
    );
  }
}