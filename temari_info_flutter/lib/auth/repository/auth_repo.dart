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

  Future<String?> signOut(User user) async {
    return this.dataProvider.signOut(user);
  }
  Future<String> forgotPassword(String email) async {
    return this.dataProvider.forgotPassword(email);
  }

  Future<String> resetPassword(String reset_link, String password) async {
    return this.dataProvider.resetPassword(reset_link, password);
  }

}