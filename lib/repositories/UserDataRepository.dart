import 'package:firebase_auth/firebase_auth.dart';
import 'package:pears/models/Utilizer.dart';
import 'package:pears/providers/BaseProviders.dart';
import 'package:pears/providers/UserDataProvider.dart';

class UserDataRepository {
  BaseUserDataProvider userDataProvider = UserDataProvider();

  Future<Utilizer> saveDetailsFromGoogleAuth(User user) =>
      userDataProvider.saveDetailsFromGoogleAuth(user);

  Future<Utilizer> saveProfileDetails(
          String uid, String profileImageUrl, int age, String username) =>
      userDataProvider.saveProfileDetails(uid, profileImageUrl, age, username);

  Future<bool> isProfileComplete(String uid) =>
      userDataProvider.isProfileComplete(uid);
}
