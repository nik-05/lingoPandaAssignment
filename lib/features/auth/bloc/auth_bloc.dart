import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingo_panda_assignment/features/auth/services/auth_services.dart';

part 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // Not following clean Architecture and DI due to time constraints...
  final AuthServices authService = AuthServices();

  AuthBloc() : super(AuthInitial()) {
    on<AuthLogin>(_authLogin);
    on<AuthSignup>(_authSignup);
    on<AuthCheckUser>(_authCheckUser);
  }

  void _authLogin(AuthLogin event, emit) async {
    emit(AuthLoading());

    try {
      final user = await authService.loginWithEmailAndPassword(
          email: event.email, password: event.password);
      if (user != null) {
        emit(AuthUserLogin(
          user: user,
        ));
      } else {
        emit(AuthErrorState('Something went wrong'));
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  void _authSignup(AuthSignup event, emit) async {
    emit(AuthLoading());
    try {
      final user = await authService.signUpWithEmailAndPassword(
          name: event.name, email: event.email, password: event.password);

      if(user != null) {
        emit(AuthUserLogin(user: user));
      } else {
        emit(AuthErrorState('Something went wrong'));
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  void _authCheckUser(AuthCheckUser event, emit) async {
    final user = await authService.checkUserLoggedIn();
    if(user != null) {
      emit(AuthUserLogin(user: user));
    } else {
      emit(AuthLogout());
    }
  }
}
