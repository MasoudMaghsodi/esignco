part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthLoginRequest extends AuthEvent {
  String mobile;

  AuthLoginRequest(this.mobile);
}

abstract class VerifyEvent {}

class AuthVerifyRequest extends VerifyEvent {
  String confirmationCode;

  AuthVerifyRequest(
    this.confirmationCode,
  );
}
