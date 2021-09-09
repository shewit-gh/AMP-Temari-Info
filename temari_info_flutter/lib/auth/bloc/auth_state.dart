import 'package:temari_info_flutter/rating/models/models.dart';
abstract class AuthState {}

class SigninInprogress extends AuthState {}

class SignUpInprogress extends AuthState {}

class SignOutInprogress extends AuthState {}

class SignedInAsNormalUser extends AuthState {}

class SignedInAsUnivUser extends AuthState {}

class SignedInAsAdminUser extends AuthState {}

class SignedOut extends AuthState {}

class ForgotPasswordInprogress extends AuthState {}

class ResetPasswordInprogress extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ResetPasswordFailed extends AuthState {
  final String resetErrorMsg;

  ResetPasswordFailed({required this.resetErrorMsg});
}

class AuthFailed extends AuthState {
  final String errorMsg;

  AuthFailed({required this.errorMsg});
}