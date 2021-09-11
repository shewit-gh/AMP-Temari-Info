import 'dart:convert';

import 'package:temari_info_flutter/auth/models/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:temari_info_flutter/auth/models/auth_token_model.dart';
import 'package:temari_info_flutter/auth/user_secure_storage.dart';

class AuthDataProvider {
  final http.Client httpClient;

  static final String _baseUrl = "http://192.168.137.85:3000/api";
AuthDataProvider({required this.httpClient});

  Future<Token> signUp(User user) async {
    print('here');
    final http.Response response = await http.post(Uri.parse("$_baseUrl/auth/signUp"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "username": user.username,
          "email": user.email,
          "password": user.password,
        }));
 print('here as well');
    if (response.statusCode == 201) {
      final current = Token.fromJson(jsonDecode(response.body));
      await  UserSecureStorage.setToken(current.value);
        print('Token saved');
        return current;

    }
    {
      return Token.fromJson(jsonDecode('{"token":"Failure"}'));
      // throw Exception("Failed to create account");
    }
  }

Future<Token> signIn(User user) async {
   print(user.email);
    final http.Response response = await http.post(Uri.parse("$_baseUrl/auth/signIn"),
           
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "email": user.email,
          "password": user.password,
        }));

    if (response.statusCode == 200) {
      final current = Token.fromJson(jsonDecode(response.body));
        await UserSecureStorage.setToken(current.value);
        print('Token saved');
       return current;
    }
    if (response.statusCode == 400) {
      return Token.fromJson(jsonDecode('{"token":"Invalid Credentials"}'));
    }
    {
      return Token.fromJson(jsonDecode('{"token":"Failure"}'));
      // throw Exception("Failed to log in");
    }
  }

  Future<String?> signOut() async {
    final email = UserSecureStorage.getEmail();
    final http.Response response = await http.put(Uri.parse("$_baseUrl/auth/signIn"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
        }));

    if (response.statusCode == 200) {
      return 'sucess';
    }
    else{
      return 'Failure';
    }
    
  }

  Future<String> forgotPassword(String email) async {
    final http.Response response = await http.put(Uri.parse("$_baseUrl/auth/forgot-Password"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
        }));

    if (response.statusCode == 200) {
      return 'success';
    }
    {
      return 'failure';
      // throw Exception("Failed try again");
    }
  }

Future<String> resetPassword(String reset_link, String password) async {
    final http.Response response = await http.put(Uri.parse("$_baseUrl/auth/reset-Password"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "password": password,
          "resetLink": reset_link
        }));

    if (response.statusCode == 200) {
      return 'success';
    }
    {
            return 'failure';
      // throw Exception("Failed to reset password");
    }
  }

  Future<String> editProfile(String username, String email) async {
    final id = UserSecureStorage.getId();
    final http.Response response = await http.put(Uri.parse("$_baseUrl/User/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "email": email
        }));

    if (response.statusCode == 200) {
      final current = Token.fromJson(jsonDecode(response.body));
      await  UserSecureStorage.setToken(current.value);
        print('Token saved');
      return 'success';
    }
    {
      return 'failure';
      // throw Exception("Failed to reset password");
    }
  }
  Future<String> changePassword(String password) async {
    final id = UserSecureStorage.getId();
    final http.Response response = await http.put(Uri.parse("$_baseUrl/User/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "password": password
        }));

    if (response.statusCode == 200) {
      final current = Token.fromJson(jsonDecode(response.body));
      await  UserSecureStorage.setToken(current.value);
      print('Token saved');
      return 'success';
    }
    {
      return 'failure';
      // throw Exception("Failed to reset password");
    }
  }

  Future<String> deleteAccount() async {
    final id = UserSecureStorage.getId();
    final http.Response response = await http.delete(Uri.parse("$_baseUrl/User/$id"),
        headers: <String, String>{"Content-Type": "application/json"},);
        

    if (response.statusCode == 200) {
      await  UserSecureStorage.deleteToken();
      return 'success';
    }
    {
      return 'failure';
      // throw Exception("Failed to reset password");
    }
  }
}

 