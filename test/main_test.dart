import 'package:flutter_test/flutter_test.dart';
import 'package:pears/main.dart';
import 'package:pears/pages/ConversationPageSlide.dart';

void main() {
  testWidgets('Main UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Pears());

    expect(find.byType(ConversationPageSlide), findsOneWidget);
  });
}
