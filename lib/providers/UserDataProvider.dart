import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pears/config/Paths.dart';
import 'package:pears/models/Utilizer.dart';
import 'package:pears/providers/BaseProviders.dart';

class UserDataProvider extends BaseUserDataProvider {
  final fireStoreDb = FirebaseFirestore.instance;

  @override
  Future<Utilizer> saveDetailsFromGoogleAuth(User user) async {
    DocumentReference ref =
        fireStoreDb.collection(Paths.usersPath).doc(user.uid); //user reference
    final bool userExists = await ref.snapshots().isEmpty;
    var data = {
      //add details received from google auth
      'uid': user.uid,
      'email': user.email,
      'name': user.displayName,
    };
    if (!userExists) {
      data['photoUrl'] = user.photoURL;
    }
    ref.set(
      data,
      SetOptions(merge: true),
    );
    final DocumentSnapshot? currentDocument = await ref.get();
    return Utilizer.fromFirestore(currentDocument!);
  }

  @override
  Future<Utilizer> saveProfileDetails(
      String uid, String profileImageUrl, int age, String username) async {
    DocumentReference ref =
        fireStoreDb.collection(Paths.usersPath).doc(uid); //user reference
    var data = {
      'photoUrl': profileImageUrl,
      'age': age,
      'username': username,
    };
    ref.set(data, SetOptions(merge: true));
    // ref.setOptions(merge: true);
    final DocumentSnapshot currentDocument = await ref.get();
    return Utilizer.fromFirestore(currentDocument);
  }

  @override
  Future<bool> isProfileComplete(String uid) async {
    DocumentReference<Map<String, dynamic>> ref =
        fireStoreDb.collection(Paths.usersPath).doc(uid);
    final DocumentSnapshot<Map<String, dynamic>> currentDocument =
        await ref.get();
    return (currentDocument.exists &&
        currentDocument.data()!.containsKey('username') &&
        currentDocument.data()!.containsKey('age'));
  }
}
