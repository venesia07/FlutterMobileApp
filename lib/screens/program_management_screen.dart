import 'package:flutter/material.dart';

class ProgramManagementScreen extends StatelessWidget {
  const ProgramManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Manage Programs',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),

        child: Column(
          children: [

            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Row(
                children: [

                  Icon(
                    Icons.search,
                    color: Colors.grey[400],
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search programs...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  Icon(
                    Icons.filter_list,
                    color: Colors.grey,
                  ),

                ],
              ),
            ),


            const SizedBox(height: 16),


            // Filters
            SizedBox(
              height: 40,

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [

                  _filterChip("All"),
                  _filterChip("Upcoming"),
                  _filterChip("Completed"),
                  _filterChip("Online"),
                  _filterChip("In-Person"),
                  _filterChip("Hybrid"),

                ],
              ),
            ),


            const SizedBox(height: 20),


            // Programs
            _programCard(
              "Leadership Fundamentals",
              "Aug 12, 2026",
              "Online",
              "Upcoming",
            ),

            _programCard(
              "Data Analytics Bootcamp",
              "Aug 19, 2026",
              "In-Person",
              "Upcoming",
            ),

            _programCard(
              "Communication & Presentation",
              "Sep 3, 2026",
              "Online",
              "Upcoming",
            ),

            _programCard(
              "Project Management Pro",
              "Sep 15, 2026",
              "Hybrid",
              "Closed",
            ),

            _programCard(
              "Design Thinking Workshop",
              "Oct 2, 2026",
              "In-Person",
              "Upcoming",
            ),

          ],
        ),
      ),
    );
  }



  Widget _filterChip(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),

      child: Chip(
        label: Text(text),

        backgroundColor:
            text == "All"
                ? Colors.green
                : Colors.grey[200],

        labelStyle: TextStyle(
          color:
              text == "All"
                  ? Colors.white
                  : Colors.black87,
        ),
      ),
    );
  }



  Widget _programCard(
    String title,
    String date,
    String type,
    String status,
  ) {

    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(12),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),


      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Expanded(
                child: Text(
                  title,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),


              Container(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),

                decoration: BoxDecoration(
                  color: status == "Closed"
                      ? Colors.grey[200]
                      : Colors.blue[50],

                  borderRadius:
                      BorderRadius.circular(12),
                ),


                child: Text(
                  status,

                  style: TextStyle(
                    color: status == "Closed"
                        ? Colors.grey
                        : Colors.blue,
                    fontSize: 12,
                  ),
                ),
              ),

            ],
          ),


          const SizedBox(height: 10),


          Row(
            children: [

              Icon(
                Icons.calendar_today,
                size: 14,
                color: Colors.grey[500],
              ),

              const SizedBox(width: 5),


              Text(
                date,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),


              const SizedBox(width: 15),


              Text(
                type,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),

            ],
          ),


          const SizedBox(height: 12),


          Row(
            children: [

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),


              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),

            ],
          )

        ],
      ),
    );
  }
}