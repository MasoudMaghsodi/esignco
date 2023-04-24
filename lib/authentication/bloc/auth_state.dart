part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthLodingState extends AuthState {}

class AuthInitiateState extends AuthState {}

class AuthResponseState extends AuthState {
  Either<String, String> response;
  AuthResponseState(this.response);
}

abstract class VerifyState {}

class VerifyLodingState extends VerifyState {}

class VerifyInitiateState extends VerifyState {}

class VerifyResponseState extends VerifyState {
  Either<String, String> response;
  VerifyResponseState(this.response);
}
