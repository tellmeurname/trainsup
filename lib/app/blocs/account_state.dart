part of 'account_bloc.dart';

abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final User user;

  AccountLoaded(this.user);
}

class AccountError extends AccountState {
  final String message;

  AccountError({required this.message});
}