import 'package:flutter/material.dart';
import 'package:pears/widgets/ChatAppBar.dart';
import 'package:pears/widgets/ChatListWidget.dart';
import 'package:pears/widgets/InputWidget.dart';
import 'package:pears/config/Palette.dart';
import 'package:pears/pages/ConversationBottomSheet.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
  const ConversationPage();
}

class _ConversationPageState extends State<ConversationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: ChatAppBar(), // Custom app bar for chat screen
            body: Stack(children: <Widget>[
              Column(
                children: <Widget>[ChatListWidget(), InputWidget()],
              ),
            ])));
  }
}
