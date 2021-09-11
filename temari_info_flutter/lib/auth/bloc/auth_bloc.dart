import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/auth/repository/auth_repo.dart';
import 'package:temari_info_flutter/auth/data_providers/auth_provider.dart';
import 'package:temari_info_flutter/auth/bloc/auth_event.dart';
import 'package:temari_info_flutter/auth/bloc/auth_state.dart';
import 'package:temari_info_flutter/auth/models/auth_model.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:temari_info_flutter/auth/user_secure_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(SignedOut());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignInEvent) {
      final User user = event.user;
      print(user);
      // reaching to the backend
      yield SigninInprogress();
      final response = await authRepository.signIn(user);

      if (response.value == "Failure") {
        yield AuthFailed(errorMsg: 'Failed to Sign in');
        await Future.delayed(Duration(seconds: 2));
           yield SignedOut();
      }
      else if (response.value == "Invalid Credentials") {
        yield AuthFailed(errorMsg: 'Incorrect Username or password');
        await Future.delayed(Duration(seconds: 2));
           yield SignedOut();
      }
      else{
        print(response.value);
      final Map current = Jwt.parseJwt(response.value);
      print(current);
      final role =current['role'];
      if (role == "Normal User"){
        yield SignedInAsNormalUser();
      };
      if (role == "University User"){
        yield SignedInAsUnivUser();
      };
      if (role == "Admin User"){
        yield SignedInAsAdminUser();
      }


      }
    
      // yield SignedOut();
  
    }

    if (event is SignUpEvent) {
      final User user = event.user;
      // reaching to the backend
      yield SignUpInprogress();
      final response = await authRepository.signUp(user);

      if (response.value == "Failure") {
        yield AuthFailed(errorMsg: 'Operation failed please try again');
        await Future.delayed(Duration(seconds: 2));
           yield SignedOut();
      }
      else{
      final Map current = Jwt.parseJwt(response.value);
     
      yield SignedInAsNormalUser();
      }
    }
    if (event is SignOutEvent) {
      // reaching to the backend
      yield SignOutInprogress();
      final response = await authRepository.signOut();

      if (response == "Failure") {
        yield AuthFailed(errorMsg: 'Failed to log out');
      yield SignedOut();
      }
    }

    if (event is ForgotPasswordEvent) {
      final String email = event.email;
      // reaching to the backend
      yield ForgotPasswordInprogress();
      final response = await authRepository.forgotPassword(email);

      if (response == "Failure") {
        yield AuthFailed(errorMsg: 'Operation failed please try again');
      }
    }
    if (event is ResetPasswordEvent) {
      final String reset_link = event.reset_link;
      final String password = event.password;
      
      // reaching to the backend
      yield ResetPasswordInprogress();
      final response = await authRepository.resetPassword(reset_link,password);

      if (response == "Failure") {
        yield ResetPasswordFailed(resetErrorMsg: 'Operation failed please try again');
      }
      yield ResetPasswordSuccess();
    }

    if (event is EditProfileEvent) {
      final String username = event.username;
      final String email = event.email;
      
      // reaching to the backend
      yield EditProfileInProgress();
      final response = await authRepository.editProfile(username, email);
      if (response == "Failure") {
        yield EditProfileFailed(editErrorMsg: 'Operation failed please try again');
      }
      yield EditProfileSuccess();
    }

    if (event is ChangePasswordEvent) {
      final String password = event.password;
      
      // reaching to the backend
      yield changePasswordInProgress();
      final response = await authRepository.changePassword(password);
      if (response == "Failure") {
        yield changePasswordFailed(changeErrorMsg: 'Operation failed please try again');
      }
      yield changePasswordSuccess();
    }

   if (event is DeleteAccountEvent) {

      // reaching to the backend
      yield deleteAccountInProgress();
      final response = await authRepository.deleteAccount();
      if (response == "Failure") {
        yield deleteAccountFailed(deleteErrorMsg: 'Operation failed please try again');
      }
      yield deleteAccountSuccess();
    }

}
  
}
