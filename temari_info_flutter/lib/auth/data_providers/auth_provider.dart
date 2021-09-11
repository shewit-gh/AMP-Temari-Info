import 'dart:convert';

import 'package:temari_info_flutter/auth/models/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:temari_info_flutter/auth/models/auth_token_model.dart';

class AuthDataProvider {
  final http.Client httpClient;
  static final String _baseUrl = "http://10.0.2.2:3000/api";
AuthDataProvider({required this.httpClient});

  Future<Token> signUp(User user) async {
    final http.Response response = await http.post(Uri.parse("$_baseUrl/auth/signUp"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "username": user.username,
          "email": user.email,
          "password": user.password,
        }));

    if (response.statusCode == 201) {
      return Token.fromJson(jsonDecode(response.body));
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
      return Token.fromJson(jsonDecode(response.body));
    }
    if (response.statusCode == 400) {
      return Token.fromJson(jsonDecode('{"token":"Invalid Credentials"}'));
    }
    {
      return Token.fromJson(jsonDecode('{"token":"Failure"}'));
      // throw Exception("Failed to log in");
    }
  }

  Future<String?> signOut(User user) async {
    final http.Response response = await http.put(Uri.parse("$_baseUrl/auth/signIn"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "email": user.email,
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
      throw Exception("Failed try again");
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
            return 'success';
      throw Exception("Failed to reset password");
    }
  }
}

 