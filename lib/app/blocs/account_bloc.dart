import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trainsup/app/models/user_model.dart'; // Импортируйте модель User здесь
import 'package:trainsup/features/account/domain/use_cases/get_user_use_case.dart';

part 'account_state.dart'; // Подключаем файл состояний

class AccountBloc extends Cubit<AccountState> {
  final GetUserUseCase getUserUseCase;

  AccountBloc(this.getUserUseCase) : super(AccountInitial());

  void fetchUser(String userId) async {
    emit(AccountLoading());
    try {
      final user = await getUserUseCase(userId);
      if (user != null) {
        emit(AccountLoaded(user)); // Используется класс User
      } else {
        emit(AccountError(message: 'User not found'));
      }
    } catch (error) {
      emit(AccountError(message: 'Failed to fetch user: $error'));
    }
  }
}