import 'package:flutter/material.dart';

import 'screens/about_us_screen.dart';
import 'screens/alerts_screen.dart';
import 'screens/home_screen.dart';
import 'screens/program_list_screen.dart';
import 'screens/profile/admin_profile_screen.dart';
import 'screens/profile/learner_profile_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/program_management_screen.dart';

void main() {
  runApp(const ExcelerateApp());
}

class ExcelerateApp extends StatelessWidget {
  const ExcelerateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excelerate App',
      initialRoute: '/splash',

      routes: {
        '/': (context) => const SplashScreen(),
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/programs': (context) => const ProgramListScreen(),
        '/admin-management': (context) => const ProgramManagementScreen(),
        '/learnerProfile': (context) => const LearnerProfileScreen(),
        '/adminProfile': (context) => const AdminProfileScreen(),
        '/aboutUs': (context) => const AboutUsScreen(),
        '/alerts': (context) => const AlertsScreen(),
      },
    );
  }
}
