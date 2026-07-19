import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/program_list_screen.dart';
import 'screens/program_details_screen.dart';
import 'screens/application_screen.dart';
import 'screens/leave_review_screen.dart';
import 'screens/profile/admin_profile_screen.dart';
import 'screens/profile/learner_profile_screen.dart';
import 'screens/splash_screen.dart';

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

      // Temporary start screen until LoginScreen is added
      initialRoute: '/',

      routes: {
        '/': (context) => const SplashScreen(),
        //'/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/programs': (context) => const ProgramListScreen(),
        '/application': (context) => const ApplicationScreen(),
        '/leaveReview': (context) => const ReviewScreen(),
        '/learnerProfile': (context) => const LearnerProfileScreen(),
        '/adminProfile': (context) => const AdminProfileScreen(),
      },
    );
  }
}