import 'package:temari_info_flutter/auth/bloc/auth_state.dart';
import 'package:temari_info_flutter/auth/data_providers/auth_provider.dart';
import 'package:temari_info_flutter/auth/models/auth_model.dart';
import 'package:temari_info_flutter/auth/models/auth_token_model.dart';

class AuthRepository {
  final AuthDataProvider dataProvider;
  AuthRepository({required this.dataProvider}) ;

  Future<Token> signUp(User user) async {
    return this.dataProvider.signUp(user);
  }

  Future<Token> signIn(User user) async {
    return this.dataProvider.signIn(user);
  }

  Future<String?> signOut() async {
    return this.dataProvider.signOut();
  }
  Future<String> forgotPassword(String email) async {
    return this.dataProvider.forgotPassword(email);
  }

  Future<String> resetPassword(String reset_link, String password) async {
    return this.dataProvider.resetPassword(reset_link, password);
  }

  Future<String> editProfile(String username, String email) async {
    return this.dataProvider.editProfile(username, email);
  }

  Future<String> changePassword(String password) async {
    return this.dataProvider.changePassword(password);
  }

  Future<String> deleteAccount() async {
    return this.dataProvider.deleteAccount();
  }


}