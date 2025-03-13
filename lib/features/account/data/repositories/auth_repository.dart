import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password);
  Future<UserCredential?> signUpWithEmailAndPassword(String email, String password);
}

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthRepository(this.firebaseAuth);

  @override
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }

  @override
  Future<UserCredential?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }
}