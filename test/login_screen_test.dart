import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_cart_app/main.dart';

void main() {
  testWidgets('validate login form', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterText(find.byKey(Key('username_field')), 'cpa_assignment1');
    await tester.enterText(find.byKey(Key('password_field')), 'group_12');

    await tester.tap(find.byKey(Key('login_button')));
    await tester.pumpAndSettle();
    expect(find.text('Fruits List'), findsOneWidget);
  });

  testWidgets('validate invalid login', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterText(find.byKey(Key('username_field')), 'test_login');
    await tester.enterText(find.byKey(Key('password_field')), 'password1');

    await tester.tap(find.byKey(Key('login_button')));
    await tester.pumpAndSettle();

    expect(find.text('Invalid username or password'), findsOneWidget);
  });
}

