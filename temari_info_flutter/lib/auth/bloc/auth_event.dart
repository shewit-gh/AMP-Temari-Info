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
  
  SignOutEvent();
}

class EditProfileEvent extends AuthEvent {
  final String username;
  final String email;

  EditProfileEvent({required this.username,required this.email});

  }

class ChangePasswordEvent extends AuthEvent {
  final String password;
  

  ChangePasswordEvent({required this.password});
  }

class DeleteAccountEvent extends AuthEvent {
  
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
