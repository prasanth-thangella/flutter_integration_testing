import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:integration_test/integration_test.dart';
import 'package:flutter_integration_testing/main.dart' as app;
// TODO 5: Import the app that you want to test

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    // TODO 4: Create your test case
    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      // TODO 7: Wait until the app has settled
      final emailFormField = find.byType(TextFormField).first;
      final passwordFormField = find.byType(TextFormField).last;
      final loginButton = find.byType(ElevatedButton).first;

      // TODO 8: create finders for email, password and login

      await tester.enterText(emailFormField, 'pthangella@test.com');
      await tester.enterText(passwordFormField, '123456789');
      await tester.pumpAndSettle();
      // TODO 9: Enter text for the email address
      // TODO 10: Enter text for the password
      // TODO 11: Tap on the login button and wait till it settled
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      // TODO 12: Find the first checkbox in the screen

      final firstcheckbox = find.byType(Checkbox).first;
      expect(
          tester.getSemantics(firstcheckbox),
          matchesSemantics(
              //hasTapAction: true,
              //hasCheckedState: true,
              isChecked: false,
              hasEnabledState: true,
              isEnabled: true,
              isFocusable: false));
      // TODO 13: Check the semantics of the checkbox if it is not checked

      tester.tap(firstcheckbox);
      await tester.pumpAndSettle();

      expect(
          tester.getSemantics(firstcheckbox),
          matchesSemantics(
              //hasTapAction: true,
              //hasCheckedState: true,
              isChecked: true,
              hasEnabledState: true,
              isEnabled: true,
              isFocusable: false));

      // TODO 13: Tap on the checkbox and wait till it settled
      // TODO 14: Expect the result to be checked
    });
  });
}
