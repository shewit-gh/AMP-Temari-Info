import 'package:temari_info_flutter/auth/models/auth_model.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final User user;
  

  SignInEvent({required this.user});
}

class SignUpEvent extends AuthEvent {
  final User user;
  

  SignUpEvent({required this.user});
}

class SignOutEvent extends AuthEvent {
  final User user;
  

  SignOutEvent({required this.user});
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  

  ForgotPasswordEvent({required this.email});
}

class ResetPasswordEvent extends AuthEvent {
  final String reset_link;
  final String password;
  

  ResetPasswordEvent({required this.reset_link,required this.password});
}