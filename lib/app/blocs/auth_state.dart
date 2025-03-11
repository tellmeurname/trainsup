import 'package:firebase_auth/firebase_auth.dart'; // Добавьте этот импорт


abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User? user; // Теперь Dart знает, что это за User

  AuthSuccess(this.user);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}