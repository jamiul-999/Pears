import 'package:flutter/material.dart';
import 'pages/ConversationPageList.dart';

void main() => runApp(Pears());

class Pears extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pears',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConversationPageList(),
    );
  }
}
