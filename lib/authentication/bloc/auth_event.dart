part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthLoginRequest extends AuthEvent {
  String mobile;

  AuthLoginRequest(this.mobile);
}

class AuthVerifyRequest extends AuthEvent {
  String confirmationCode;

  AuthVerifyRequest(this.confirmationCode);
}
