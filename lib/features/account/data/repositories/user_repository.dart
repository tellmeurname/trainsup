import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trainsup/app/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore firestore;

  UserRepository(this.firestore);

  Future<User?> getUser(String userId) async {
    try {
      var snapshot = await firestore.collection('users').doc(userId).get();
      if (!snapshot.exists) return null;
      return User.fromMap(snapshot.data()!);
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  Future<void> createUser(User user) async {
    try {
      await firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      print('Error creating user: $e');
    }
  }
}