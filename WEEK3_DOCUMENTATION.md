# Week 3 Documentation

## Overview

The goal of Week 3 is to make the Excelerate mobile application more interactive and functional by integrating dynamic data, form validation, loading indicators, and error handling.

This document summarizes the Week 3 features that have been implemented and tested in the current integrated build.

## 1. Screens Using JSON Data

The application uses local JSON files as mock backend data.

### Program Listing

Program data is loaded from:

`assets/data/programs.json`

The Program Listing screen dynamically displays program information from the JSON file instead of relying on hardcoded program data.

The displayed information includes:
- Program title
- Description
- Start date
- Location
- Program image

### Program Details

When a user selects a program, the Program Details screen displays the corresponding dynamic information, including:

- Program title
- Description
- Location
- Start and end dates
- Requirements
- Skills
- Program image

This functionality was tested successfully using multiple programs.

## 2. Forms with Validation

Form validation has been implemented on the Login screen.

The following validation scenarios were tested:

- Empty email field displays a required-field message.
- Empty password field displays a required-field message.
- Invalid email format displays an appropriate validation message.
- Passwords shorter than the minimum required length display a validation message.
- Valid learner credentials successfully navigate the user into the application.

The tested validation functionality is working as expected.

## 3. Loading Indicators

A loading indicator is implemented while program data is being loaded from the local JSON file.

The application uses a loading state to display a `CircularProgressIndicator` while waiting for the program data to load.

This provides visual feedback to the user during data loading.

## 4. Error Handling

Error handling has been implemented for program data loading.

If the program data cannot be loaded successfully, the application displays a user-friendly error message instead of leaving the screen blank or causing the application to fail unexpectedly.

The Program Listing also provides a "No Programs Found" state when a search does not match any available programs.

## 5. Search and Filtering

The Program Listing includes search functionality.

Users can search programs using keywords, and the displayed program list updates based on the search query.

Testing confirmed that:

- Matching programs are filtered correctly.
- Non-matching searches display the "No Programs Found" message.

## 6. UI and Navigation Testing

Initial UI and navigation testing was conducted on the current integrated application.

The following were successfully tested:

- Login form validation
- Learner login
- Home screen navigation
- Program Listing
- Program Details
- Program search and filtering
- No Programs Found state
- Navigation to Application screen
- Navigation to Review screen
- Navigation to Profile screen

Some screens and features are still under development by other team members and will continue to be updated as integration progresses.

## Summary

Week 3 development has introduced dynamic JSON-based program data, form validation, loading states, error handling, search functionality, and improved application interactivity.

The implemented features were reviewed and tested on the current integrated build. Documentation will be updated as additional Week 3 features are completed and integrated.