part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthLodingState extends AuthState {}

class AuthInitiateState extends AuthState {}

class AuthResponseState extends AuthState {
  Either<String, String> response;
  AuthResponseState(this.response);
}
