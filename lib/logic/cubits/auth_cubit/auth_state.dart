part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {
  final String message;
  LoginError(this.message);
}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpError extends AuthState {
  final String message;
  SignUpError(this.message);
}
