// @dart=2.9

import 'package:flutter_test/flutter_test.dart';
import 'package:pears/main.dart';
import 'package:pears/pages/RegisterPage.dart';

void main() {
  testWidgets('Main UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Pears());

    expect(find.byType(RegisterPage), findsOneWidget);
  });
}
