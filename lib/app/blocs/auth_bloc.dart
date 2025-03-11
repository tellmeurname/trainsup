import 'package:bloc/bloc.dart';
import 'package:trainsup/features/account/domain/use_cases/auth_use_case.dart';
import 'auth_state.dart';
part 'auth_event.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;

  AuthBloc(this.authUseCase) : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await authUseCase.signIn(event.email, event.password);
        if (result != null) {
          emit(AuthSuccess(result.user)); // Переход к HomeScreen
        } else {
          emit(AuthError('Failed to sign in'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await authUseCase.signUp(event.email, event.password);
        if (result != null) {
          emit(AuthSuccess(result.user)); // Переход к HomeScreen
        } else {
          emit(AuthError('Failed to sign up'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}