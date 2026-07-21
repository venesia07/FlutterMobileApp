import 'package:flutter/material.dart';
import '../models/program.dart';

class ApplicationScreen extends StatefulWidget {
  final Program program;

  const ApplicationScreen({
    super.key,
    required this.program,
  });

  @override
  State<ApplicationScreen> createState() =>
      _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _motivationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _motivationController.dispose();
    super.dispose();
  }

  void submitApplication() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Application submitted successfully!"),
          backgroundColor: Colors.green,
        ),
      );

      _formKey.currentState!.reset();

      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _motivationController.clear();
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xffF8F9FD),

    appBar: AppBar(
      title: const Text("Application"),
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
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              /*Center(
              child: Image.asset(
                "assets/images/excelerate_logo.png",
                height: 85,
              ),
            ),*/

            const SizedBox(height: 20),

          Center(
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: "Start your journey with "),
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
          Center(
            child: Text(
                            "Learn • Grow • Succeed",
                            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                          ),
          ),
          
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
                    padding: const EdgeInsets.symmetric(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.red),

                      const SizedBox(width: 8),

                      Text(widget.program.location),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          color: Colors.red),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Text(
                          "${widget.program.startDate}  -  ${widget.program.endDate}",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Text(
                    widget.program.description,
                    style:
                        const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),            
            
            
            const SizedBox(height: 8),

            Text(
              "Complete the form below to submit your application.",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 15,
              ),
            ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _emailController,
                decoration:  InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }

                  if (!RegExp(
                    r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return "Please enter a valid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration:  InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.call_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _motivationController,
                maxLines: 5,
                decoration:  InputDecoration(
                  labelText: "Why are you applying",
                  prefixIcon: Icon(Icons.edit_note_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please tell us why you're applying";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              Text(
              "By submitting this application, you confirm that all information provided is accurate.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 25),

              SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitApplication,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Submit Application",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    )
    );
  }
}