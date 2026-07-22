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
                "Application Submitted",
                textAlign: TextAlign.center,
              ),
            ],
          ),

          content: const Text(
            "Thank you for applying!\n\nYour application has been submitted successfully. Our team will contact you if you are shortlisted.",
          ),

          actions: [

            ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),

              onPressed: () {

                Navigator.pop(context);

                Navigator.pop(context);

              },

              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        );
      },
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: const [
                  TextSpan(text: "Start your journey with "),
                  TextSpan(
                    text: "Excelerate",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              softWrap: true,
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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

                  const SizedBox(height: 8),

                  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    style:
                        const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),           
            
            const Divider(
              thickness: 1,
              height: 40,
            ),
            const SizedBox(height: 8),

            const Text(
                "Applicant Information",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Please complete all required fields.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 25),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
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
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
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
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.call_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
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
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(                    
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
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
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
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