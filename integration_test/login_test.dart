import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

import 'package:convert_me/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    app.main();
    testWidgets('login', (WidgetTester tester) async {
      await tester.pumpAndSettle();

      // wait for splash screen
      await Future.delayed(Duration(seconds: 3));

      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 1));

      await tester.enterText(find.byType(TextField), 'youssef');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 1));

      // Verifies that the TextField contains the name
      expect(find.text('youssef'), findsOneWidget);

      final Finder dropDown1 = find.byKey(Key("dropDown1"));
      await tester.tap(dropDown1);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 1));

      final Finder amd = find.text('AMD');
      await tester.tap(amd.last);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 1));

      final Finder dropDown2 = find.byKey(Key("dropDown2"));
      await tester.tap(dropDown2);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 1));

      // expect(find.text('AMD'), findsNWidgets(2));

      final Finder aud = find.text('AUD');
      await tester.tap(aud.last);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 1));

      final Finder signIn = find.text('Sign in');
      await tester.tap(signIn);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 1));

      expect(find.text('AMD'), findsWidgets);
      expect(find.text('AUD'), findsWidgets);
      expect(find.text('input'), findsWidgets);
      expect(find.text('output'), findsWidgets);
      expect(find.text('Discard'), findsWidgets);
      expect(find.text('Save'), findsWidgets);
    });
  });
}
