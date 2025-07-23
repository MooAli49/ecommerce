import 'package:cloud_firestore/cloud_firestore.dart';

import '../../feature/auth/data/models/user_model.dart';

class FirestoreUser {
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addUserToFirestore(UserModel user) async {
    try {
      await usersCollection.doc(user.id).set(user.toJson());
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  }

  Future<DocumentSnapshot> getCurrentUserFromFirestore(String userId) async {
    try {
      return await usersCollection.doc(userId).get();
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

}
