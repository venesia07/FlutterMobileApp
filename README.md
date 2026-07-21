Team 13 Mobile Application

Project Overview

This project is a Flutter-based mobile application developed as part of the Excelerate Mobile Application Development Internship.
The application aims to provide users with an intuitive and user-friendly platform that reflects the services and information available on the Excelerate website, while offering the convenience of a mobile application.

Project Vision
To develop a modern, responsive, and easy-to-use mobile application that delivers an engaging user experience while demonstrating best practices in Flutter development.

Objectives
- Develop a cross-platform mobile application using Flutter.
- Apply industry-standard software development practices.
- Collaborate effectively using Git and GitHub.
- Design a clean and intuitive user interface.
- Build a scalable and maintainable application.

Target Users
- Excelerate Learners
- Excelerate Administrators

Features Implemented (Week2)
- Login Screen UI
- Home Screen UI (for learners)
- Home Screen UI (for admins)
- Program Listing Screen UI 
- Program Details Screen UI 
- Leave Review Screen UI
- Application Screen UI
- Profile Screen UI (for learners)
- Profile Screen UI (for admins)
- Manage Programs Sceen UI (for admins)

 Planned Features
- User Authentication (Login)
- Home Dashboard
- Program Listings
- Program Details
- Program Management 
- User Profile
- Navigation Drawer/Bottom Navigation
- Responsive User Interface

Technology Stack
- Flutter
- Dart
- Git
- GitHub
- Android Studio
- Visual Studio Code
- Figma (Wireframing)

Navigation Flow
Learners: 
Login
 ↓
Home
 ↓
Program Listing
        ↓ (if program is selected)
        Program Details
              ↓ (if apply button is clicked)
              Application Screen 
              ↓ (if leave review button is clicked)
              Leave Review Screen
 ↓ 
Profile

Admins:
Login
 ↓
Home
 ↓
Program Management
 ↓ 
Profile


Installation

1. Clone the repository
Command to use:
git clone https://github.com/venesia07/team13-mobile-app.git


2. Navigate to the project folder
Command to use:
cd team13_mobile_app


3. Install dependencies
Command to use:
flutter pub get

4. Run the application

Command to use: 
flutter run


Version Control
Git and GitHub are used for version control and collaboration throughout the project.

Team

Project Team: Team 13

Team Lead:
- Venesia Swartz

Contributors:
- Aakash Bajpai 
- Ananya Verma 
- Brayson Imbambi
- Venesia Swartz


Project Status
Week 1 – Project Planning and Setup ✅

Current Progress:
- Repository Created
- Flutter Project Initialized
- Git Version Control Configured
- App Proposal 
- Wireframes 
- Team Charter 


Week 2 - Transform low-fidelity wireframes into functional Flutter UI 

Current Progress:
- Developed the application's core screens.
- Implemented navigation between screens.
- Created reusable Flutter widgets.
- Maintained consistent UI design.
- Updated project documentation.

Screenshots:


Week 3 - Dynamic Data Integration and Application Functionality

Current Progress:
- Integrated local JSON data to replace hardcoded program data.
- Program Listing dynamically loads program information from programs.json.
- Program Details displays dynamic program information including description, requirements, and skills.
- Implemented form validation for required fields, email format, and password requirements.
- Added loading indicators while program data is being loaded.
- Added user-friendly error handling when program data cannot be loaded.
- Implemented program search and filtering functionality.
- Added a "No Programs Found" state when no search results match.
- Conducted initial UI and navigation testing across the application.

Week 3 Testing:
- Login form validation: Passed
- Learner login and navigation: Passed
- Program Listing JSON integration: Passed
- Program Details dynamic data: Passed
- Program search and filtering: Passed
- No Programs Found state: Passed
- Application and Review screens: Still in development
- Profile features: Still in development

Note:
Some screens and features are still being developed by team members and will be updated as integration continues.