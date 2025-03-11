import 'package:firebase_auth/firebase_auth.dart'; // Добавьте этот импорт
import 'package:trainsup/features/account/data/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  Future<UserCredential?> signIn(String email, String password) async {
    return await repository.signInWithEmailAndPassword(email, password);
  }

  Future<UserCredential?> signUp(String email, String password) async {
    return await repository.signUpWithEmailAndPassword(email, password);
  }
}