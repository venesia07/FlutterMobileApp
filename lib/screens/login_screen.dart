import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLearner = true;
  bool obscurePassword = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (isLearner) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/admin-management");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),

          child: Column(
            children: [

              const SizedBox(height: 40),

              // LOGO
              Image.asset(
                "assets/images/excelerate_logo.png",
                height: 120,
              ),

              const SizedBox(height: 15),

              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Learn • Grow • Succeed",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 35),

              // ROLE SELECTOR
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Row(
                  children: [

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLearner = true;
                          });
                        },

                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),

                          decoration: BoxDecoration(
                            color: isLearner
                                ? Colors.red
                                : Colors.transparent,

                            borderRadius: BorderRadius.circular(30),
                          ),

                          child: Text(
                            "Learner",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isLearner
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLearner = false;
                          });
                        },

                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),

                          decoration: BoxDecoration(
                            color: !isLearner
                                ? Colors.red
                                : Colors.transparent,

                            borderRadius: BorderRadius.circular(30),
                          ),

                          child: Text(
                            "Admin",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: !isLearner
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                controller: emailController,

                decoration: InputDecoration(
                  hintText: "Email",

                  prefixIcon: const Icon(Icons.email),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: obscurePassword,

                decoration: InputDecoration(
                  hintText: "Password",

                  prefixIcon: const Icon(Icons.lock),

                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},

                  child: const Text(
                    "Forgot Password?",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: login,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 0,

                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: Text(
                    isLearner
                        ? "Login as Learner"
                        : "Login as Admin",

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              if (isLearner)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    const Text(
                      "Don't have an account?",
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/signup",
                        );
                      },

                      child: const Text(
                        "Sign Up",
                      ),
                    ),
                  ],
                ),

              if (!isLearner)
                const Text(
                  "Administrator accounts are created by Excelerate.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}