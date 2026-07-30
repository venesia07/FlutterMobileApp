Excelerate Mobile Application
Team 13 – Mobile Application Development Internship


Project Overview:
The Excelerate Mobile Application is a Flutter-based learner application developed during the Excelerate Mobile Application Development Internship. The application provides learners with an intuitive platform to browse available programmes, apply for opportunities, leave reviews, save favourite programmes, and manage their learning journey through a modern mobile experience.
The project was developed over a four-week internship using Flutter and Dart while following industry-standard software development practices, version control workflows, and collaborative development through GitHub.

Project Vision:
To develop a modern, responsive, and user-friendly mobile application that enhances learner engagement while demonstrating best practices in Flutter application development.

Objectives:
- Develop a cross-platform mobile application using Flutter.
- Apply professional software development practices.
- Collaborate effectively using Git and GitHub.
- Build reusable and maintainable Flutter components.
- Design a clean, accessible and intuitive user interface.
- Implement dynamic data using local JSON.
- Produce a portfolio-ready mobile application.

Target Users:
- Excelerate Learners

Features:
The application currently includes the following functionality:

Authentication
- Login
- Sign Up
- Forgot Password
- Input validation

Home
- Learner Dashboard
- Featured Programmes
- Quick Navigation
- Notification Badge

Programmes
- Browse available programmes
- Dynamic programme listing using JSON
- Programme details
- Programme requirements
- Skills covered
- Programme category
- Delivery method
- Programme duration

Applications
- Apply for programmes
- Form validation
- Application confirmation

Reviews
- Submit programme reviews
- Star rating
- Recommendation option
- Review confirmation

Saved Programmes
- Save programmes
- Remove saved programmes
- Saved programme history

Alerts
- Login notifications
- Application notifications
- Review notifications
- Save programme notifications
- Remove programme notifications
- Alert history

Learner Profile
- View learner information
- Edit profile (UI)
- Applications summary
- Saved programmes summary
- Reviews summary
- Notification access
- Settings
- Help & Support
- About Excelerate
- Logout

Technologies Used:
- Flutter
- Dart
- JSON
- Git
- GitHub
- Android Studio
- Visual Studio Code
- Material Design

Project Structure:
lib/
│
├── models/
├── screens/
├── services/
├── widgets/
├── assets/
│   ├── images/
│   └── data/
├── main.dart

Installation:
1. Clone the repository:
      git clone https://github.com/venesia07/team13-mobile-app.git

2. Navigate to the project:
      cd team13_mobile_app

3. Install dependencies
      flutter pub get


4. Run the application
      flutter run

Application Navigation:
Login
   │
   ▼
Home
   │
   ├──────────────► Programs
   │                    │
   │                    ▼
   │             Program Details
   │               │         │
   │               ▼         ▼
   │         Apply        Leave Review
   │
   ▼
Profile
   │
   ├── Saved Programs
   ├── Applications
   ├── Reviews
   ├── Alerts
   ├── Settings
   ├── Help & Support
   └── About Us

Screenshots:
The following screenshots are included within the project documentation.
- Login Screen
- Sign Up Screen
- Home Screen
- Program Listing Screen
- Program Details Screen
- Application Screen
- Leave Review Screen
- Alerts Screen
- Learner Profile Screen
- About Us Screen

Key Flutter Concepts Demonstrated:
- Stateful Widgets
- Stateless Widgets
- Navigation & Routing
- Form Validation
- JSON Data Integration
- Local In-Memory State Management
- Custom Services
- Reusable Widgets
- Bottom Navigation
- Material Design Components

Team:
Team 13

Team Lead
- Venesia Swartz

Team Members
- Venesia Swartz
- Aakash Bajpai
- Ananya Verma
- Brayson Imbambi

Collaboration:
The project was developed collaboratively using GitHub.

Development included:
- Feature branches
- Pull Requests
- Branch merging
- Code reviews
- Repository management
- Version control

Development Summary:
Week 1
- Project planning
- Team charter
- GitHub repository setup
- Flutter project setup
- Wireframes
- App proposal

Week 2
- Developed core application UI
- Implemented navigation
- Built reusable widgets
- Designed learner interface

Week 3
- JSON data integration
- Dynamic programme loading
- Form validation
- Improved navigation
- UI testing
- Documentation updates

Week 4
- Added learner activity tracking
- Implemented alerts system
- Added saved programmes
- Added application history
- Added review history
- Improved learner profile
- Repository cleanup
- Removed obsolete code
- Final testing
- Documentation
- Presentation preparation

Future Improvements:
Future versions of the application may include:
- Firebase Authentication
- Cloud Firestore integration
- Push Notifications
- Persistent user accounts
- Profile picture upload
- Real-time programme updates
- Application status tracking (Applied, Shortlisted, Accepted, Rejected)
- Review editing and deletion
- Saved data persistence using Hive or SQLite
- Dark mode
- User settings customization

Testing:
The application was tested throughout development to ensure:
- Correct navigation
- Form validation
- JSON loading
- User interactions
- Alert generation
- Saved programme functionality
- Application submission
- Review submission
- Responsive layouts

License:
This project was developed for educational purposes as part of the Excelerate Mobile Application Development Internship.

Acknowledgements:
Special thanks to:
- Excelerate
- Internship Mentors
- Team 13 members
- Flutter Community
- Open Source Contributors


_Developed using Flutter_
