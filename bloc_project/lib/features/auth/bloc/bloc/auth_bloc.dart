import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController userController = TextEditingController();
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<trySignUp>((event, emit) async {
      try {
        emit(AuthLoading());

        await Supabase.instance.client.auth.signUp(
          password: passwordController.text,
          email: emailController.text,
        );

        emailController.clear();
        passwordController.clear();
        userController.clear();
        emit(SucsessSignUp());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<trySignIn>((event, emit) async {
      try {
        emit(AuthLoading());

        await Supabase.instance.client.auth.signInWithPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        emailController.clear();
        passwordController.clear();
        emit(SucsessSignin());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
