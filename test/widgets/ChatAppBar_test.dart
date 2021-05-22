import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pears/widgets/ChatAppBar.dart';

void main() {
  const MaterialApp app = MaterialApp(
    home: Scaffold(body: const ChatAppBar()),
  );
  testWidgets('ChatAppBar UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app);

    expect(find.text('Bruce Wayne'), findsOneWidget);
    expect(find.text('@darkknight'), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(1));
    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}
