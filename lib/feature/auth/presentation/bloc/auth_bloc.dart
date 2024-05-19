import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inkwell/feature/auth/domain/entities/profile.dart';
import 'package:inkwell/feature/auth/domain/usecases/user_sign_in.dart';
import 'package:inkwell/feature/auth/domain/usecases/user_sign_up.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp signUp;
  final UserSignIn signIn;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
  })  : signUp = userSignUp,
        signIn = userSignIn,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await signUp(
      UserSignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    response.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthSuccess(r)),
    );
  }

  void _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await signIn(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );
    response.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthSuccess(r)),
    );
  }
}
