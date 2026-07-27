import 'package:flutter/material.dart';
import '../models/program.dart';

class ReviewScreen extends StatefulWidget {
  final Program program;

  const ReviewScreen({
    super.key,
    required this.program,
  });

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController =
      TextEditingController();

  final TextEditingController _reviewController =
      TextEditingController();

  int rating = 0;
  bool recommend = true;

  @override
  void dispose() {
    _titleController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),

      appBar: AppBar(
        title: const Text("Leave Review"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 15),

                Center(
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),

                      children: const [

                        TextSpan(
                          text: "Share Your Experience\nwith ",
                        ),

                        TextSpan(
                          text: "Excelerate",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 8),

                Center(
                  child: Text(
                    "Learn • Grow • Succeed",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Card(
                  elevation: 3,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(12),

                          child: Image.asset(
                            widget.program.image,
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          widget.program.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius:
                                BorderRadius.circular(20),
                          ),

                          child: Text(
                            widget.program.category,
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),
                  
                  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.computer,
                      color: Colors.red,
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        widget.program.deliveryMethod,
                      ),
                    ),
                  ],
                ),

                  const SizedBox(height: 8),
                        Row(
                          children: [

                            const Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                widget.program.location,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            const Icon(
                              Icons.calendar_today,
                              color: Colors.red,
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                "Starts: ${widget.program.startDate}\nEnds: ${widget.program.endDate}",
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Text(
                          widget.program.description,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                "Rate this Program",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                children: List.generate(5, (index) {
                  return IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    ),
                    iconSize: 34,
                    splashRadius: 22,
                    icon: Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        rating = index + 1;
                      });
                    },
                  );
                }),
              ),

              const SizedBox(height: 30),

              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a review title";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Review Title",
                  prefixIcon: const Icon(Icons.title),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _reviewController,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please write your review";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Your Review",
                  alignLabelWithHint: true,
                  prefixIcon: const Icon(Icons.rate_review),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.thumb_up, color: Colors.red),

                  const SizedBox(width: 10),

                  const Expanded(
                    child: Text(
                      "Would you recommend this program?",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  Switch(
                  activeThumbColor: Colors.red,
                  activeTrackColor: Colors.red.shade200,
                  value: recommend,
                  onChanged: (value) {
                    setState(() {
                      recommend = value;
                    });
                  },
                ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (rating == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select a star rating."),
                        ),
                      );
                      return;
                    }

                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),

                            title: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 45,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Review Submitted",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),

                            content: const Text(
                              "Thank you for sharing your experience!\n\nYour feedback will help future learners choose the right programme.",
                              textAlign: TextAlign.center,
                            ),

                            actionsAlignment: MainAxisAlignment.center,

                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(120, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                            
                          );
                        },
                      );

                      _titleController.clear();
                      _reviewController.clear();

                      setState(() {
                        rating = 0;
                        recommend = true;
                      });

                      _formKey.currentState!.reset();
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: const Text(
                    "Submit Review",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}