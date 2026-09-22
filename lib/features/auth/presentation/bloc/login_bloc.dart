import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login.dart';
import 'login_event.dart';
import 'login_state.dart';
// Event
// ↓
// Loading
// ↓
// UseCase
// ↓
// Success / Failure
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;

  LoginBloc(this.login)
      : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event,
      Emitter<LoginState> emit,
      ) async {
    emit(
      state.copyWith(
        status: LoginStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      final user = await login(
        event.email,
        event.password,
      );

      emit(
        state.copyWith(
          status: LoginStatus.success,
          user: user,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}