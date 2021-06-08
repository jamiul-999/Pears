import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pears/models/Utilizer.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const <dynamic>[]]); // : super(props);
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';

  @override
  List<Object?> get props => throw Uninitialized();
}

class AuthInProgress extends AuthenticationState {
  @override
  String toString() => 'AuthInProgress';

  @override
  List<Object?> get props => throw AuthInProgress();
}

class Authenticated extends AuthenticationState {
  final User user;
  Authenticated(this.user);
  @override
  String toString() => 'Authenticated';

  @override
  List<Object?> get props => throw Authenticated(user);
}

class PreFillData extends AuthenticationState {
  final Utilizer user;
  PreFillData(this.user);
  @override
  String toString() => 'PreFillData';

  @override
  List<Object?> get props => throw PreFillData(user);
}

class UnAuthenticated extends AuthenticationState {
  @override
  String toString() => 'UnAuthenticated';

  @override
  List<Object?> get props => throw UnAuthenticated();
}

class ReceivedProfilePicture extends AuthenticationState {
  final File file;
  ReceivedProfilePicture(this.file);
  @override
  toString() => 'ReceivedProfilePicture';

  @override
  List<Object?> get props => throw ReceivedProfilePicture(file);
}

class ProfileUpdateInProgress extends AuthenticationState {
  @override
  String toString() => 'ProfileUpdateInProgress';

  @override
  List<Object?> get props => throw ProfileUpdateInProgress();
}

class ProfileUpdated extends AuthenticationState {
  @override
  String toString() => 'ProfileComplete';

  @override
  List<Object?> get props => throw ProfileUpdated();
}
