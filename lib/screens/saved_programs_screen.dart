import 'package:flutter/material.dart';

import '../services/saved_program_service.dart';
import 'program_details_screen.dart';

class SavedProgramsScreen extends StatefulWidget {
  const SavedProgramsScreen({super.key});

  @override
  State<SavedProgramsScreen> createState() =>
      _SavedProgramsScreenState();
}

class _SavedProgramsScreenState
    extends State<SavedProgramsScreen> {

  @override
  Widget build(BuildContext context) {

    final savedPrograms =
        SavedProgramService.instance.savedPrograms;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Saved Programs"),
        centerTitle: true,
      ),

      body: savedPrograms.isEmpty

          ? const Center(
              child: Text(
                "No saved programs yet.",
                style: TextStyle(fontSize: 16),
              ),
            )

          : ListView.builder(

              padding: const EdgeInsets.all(16),

              itemCount: savedPrograms.length,

              itemBuilder: (context, index) {

                final program = savedPrograms[index];

                return Card(

                  margin:
                      const EdgeInsets.only(bottom: 15),

                  child: ListTile(

                    leading: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8),

                      child: Image.asset(
                        program.image,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),

                    title: Text(
                      program.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(program.category),

                    trailing: const Icon(
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

                      ).then((_) {
                        setState(() {});
                      });

                    },
                  ),
                );
              },
            ),
    );
  }
}