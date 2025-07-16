import 'package:cloud_firestore/cloud_firestore.dart';
import '../../feature/auth/data/models/user_model.dart';

class FirestoreUser {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserModel user) async {
    try {
      await users.doc(user.id).set(user.toJson());
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  }
}
