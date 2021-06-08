//import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'dart:io';

//import 'package:pears/models/Utilizer.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
  //AuthenticationEvent([List props = const <dynamic>[]]); // : super(props);
  //const AuthenticationEvent();
}

class AppLaunched extends AuthenticationEvent {
  @override
  String toString() => 'AppLaunched';
}

class ClickedGoogleLogin extends AuthenticationEvent {
  @override
  String toString() => 'ClickedGoogleLogin';
}

class LoggedIn extends AuthenticationEvent {
  final User user;
  LoggedIn(this.user);
  @override
  String toString() => 'LoggedIn';
}

class PickedProfilePicture extends AuthenticationEvent {
  final File file;
  PickedProfilePicture(this.file);
  @override
  String toString() => 'PickedProfilePicture';
}

class SaveProfile extends AuthenticationEvent {
  final File profileImage;
  final int age;
  final String username;
  SaveProfile(this.profileImage, this.age, this.username);
  @override
  String toString() => 'SaveProfile';
}

class ClickedLogout extends AuthenticationEvent {
  @override
  String toString() => 'ClickedLogout';
}
