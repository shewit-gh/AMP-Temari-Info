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
class ForgotPasswordSuccess extends AuthState {}

class ForgotPasswordFailed extends AuthState {
  final String forgotErrorMsg;

  ForgotPasswordFailed({required this.forgotErrorMsg});
}

class EditProfileInProgress extends AuthState {}

class EditProfileSuccess extends AuthState {}

class EditProfileFailed extends AuthState {
  final String editErrorMsg;

  EditProfileFailed({required this.editErrorMsg});
}

class changePasswordInProgress extends AuthState {}

class changePasswordSuccess extends AuthState {}

class changePasswordFailed extends AuthState {
  final String changeErrorMsg;

  changePasswordFailed({required this.changeErrorMsg});
}

class ResetPasswordInprogress extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ResetPasswordFailed extends AuthState {
  final String resetErrorMsg;

  ResetPasswordFailed({required this.resetErrorMsg});
}
class deleteAccountInProgress extends AuthState {}

class deleteAccountSuccess extends AuthState {}

class deleteAccountFailed extends AuthState {
  final String deleteErrorMsg;

  deleteAccountFailed({required this.deleteErrorMsg});
}

class AuthFailed extends AuthState {
  final String errorMsg;

  AuthFailed({required this.errorMsg});
}