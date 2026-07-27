// Basic smoke test for ExcelerateApp.

import 'package:flutter_test/flutter_test.dart';

import 'package:team13_mobile_app/main.dart';

void main() {
  testWidgets('ExcelerateApp smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const ExcelerateApp());

    // Pump past the SplashScreen's 3-second navigation timer.
    await tester.pumpAndSettle(const Duration(seconds: 4));
  });
}
