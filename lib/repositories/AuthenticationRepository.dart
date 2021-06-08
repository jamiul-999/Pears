import 'package:firebase_auth/firebase_auth.dart';
import 'package:pears/providers/AuthenticationProvider.dart';
import 'package:pears/providers/BaseProviders.dart';

class AuthenticationRepository {
  BaseAuthenticationProvider authenticationProvider = AuthenticationProvider();

  Future<User> signInWithGoogle() => authenticationProvider.signInWithGoogle();
  Future<void> signOutUser() => authenticationProvider.signOutUser();
  Future<User> getCurrentUser() => authenticationProvider.getCurrentUser();
  Future<bool> isLoggedIn() => authenticationProvider.isLoggedIn();
}
