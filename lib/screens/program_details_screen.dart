import 'package:flutter/material.dart';
import '../models/program.dart';
import '../widgets/bottom_nav_bar.dart';
import '../screens/application_screen.dart';
import '../screens/leave_review_screen.dart';
import '../services/alert_service.dart';
import '../services/saved_program_service.dart';

class ProgramDetailsScreen extends StatefulWidget {
  final Program program;

  const ProgramDetailsScreen({
    super.key,
    required this.program,
    });

   @override
  State<ProgramDetailsScreen> createState() =>
      _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState
    extends State<ProgramDetailsScreen> {

  late bool isSaved;

  @override
  void initState() {
    super.initState();

    isSaved = SavedProgramService.instance
        .isSaved(widget.program);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text("Program Details"),
  centerTitle: true,

  actions: [
    IconButton(
      icon: Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
      ),
      onPressed: () {
       setState(() {

          SavedProgramService.instance
              .toggleProgram(widget.program);

          isSaved = SavedProgramService.instance
              .isSaved(widget.program);

        });

        if (isSaved) {
          AlertService.instance.addAlert(
            title: "Program Saved",
            message:
                "${widget.program.title} has been added to your saved programs.",
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Program saved."),
            ),
          );
        } else {

          AlertService.instance.addAlert(
            title: "Program Removed",
            message:
                "${widget.program.title} has been removed from your saved programs.",
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Program removed."),
            ),
          );

        }
      },
    ),
  ],
),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Program Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.program.image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Program Title
            Text(
              widget.program.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            //Program Category
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.program.category,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Delivery method
            Row(
              children: [
                const Icon(
                  Icons.computer,
                  color: Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.program.deliveryMethod,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Location
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.program.location,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Start Date
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.blue,
                ),
                const SizedBox(width: 8),
                Text(
                  "Start: ${widget.program.startDate}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // End Date
            Row(
              children: [
                const Icon(
                  Icons.event,
                  color: Colors.green,
                ),
                const SizedBox(width: 8),
                Text(
                  "End: ${widget.program.endDate}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              "Program Description",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.program.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 25),

            const Text(
              "Requirements",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ...widget.program.requirements.map(
              (requirement) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        color: Colors.green, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(requirement),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Skills You'll Learn",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: widget.program.skills.map((skill) {
                return Chip(
                  label: Text(skill),
                  backgroundColor: Colors.red.shade100,
                );
              }).toList(),
            ),

            const SizedBox(height: 35),

            SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ApplicationScreen(program: widget.program,),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
    ),
    child: const Text(
      'Apply Now',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  ),
),
            const SizedBox(height: 15),

            const SizedBox(height: 15),

SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewScreen(program: widget.program, ),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
    ),
    child: const Text(
      'Leave Review',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  ),
),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;

          case 1:
            Navigator.pop(context);
            break;

          case 2:
            Navigator.pushNamed(context, '/learnerProfile');
            break;
        }
      },
      ),

    );
  }
}
  