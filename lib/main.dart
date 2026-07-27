import 'package:flutter/material.dart';

// Admin screens
import 'screens/admin_home_screen.dart';
import 'screens/program_management_screen.dart';
import 'screens/profile/admin_profile_screen.dart';

// Learner screens
import 'screens/home_screen.dart';
import 'screens/program_list_screen.dart';
import 'screens/program_details_screen.dart';
import 'screens/application_screen.dart';
import 'screens/leave_review_screen.dart';
import 'screens/profile/learner_profile_screen.dart';

// Auth screens
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';

// Additional screens
import 'screens/about_us_screen.dart';
import 'screens/alerts_screen.dart';

//import 'theme/app_theme.dart';

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
      //theme: AppTheme.lightTheme,

      // Use splash screen as starting point
      initialRoute: '/splash',

      routes: {
        // Auth routes
        '/': (context) => const SplashScreen(),
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),

        // Learner routes
        '/home': (context) => const HomeScreen(),
        '/programs': (context) => const ProgramListScreen(),
        '/application': (context) => const ApplicationScreen(),
        '/leaveReview': (context) => const ReviewScreen(),
        '/learnerProfile': (context) => const LearnerProfileScreen(),

        // Admin routes
        '/admin-home': (context) => const AdminHomeScreen(),
        '/admin-management': (context) => const ProgramManagementScreen(),
        '/adminProfile': (context) => const AdminProfileScreen(),

        // Additional screens
        '/aboutUs': (context) => const AboutUsScreen(),
        '/alerts': (context) => const AlertsScreen(),
      },
    );
  }
}
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
