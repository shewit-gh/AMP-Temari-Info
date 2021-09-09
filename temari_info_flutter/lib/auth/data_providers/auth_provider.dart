import 'dart:convert';

import 'package:temari_info_flutter/auth/models/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:temari_info_flutter/auth/models/auth_token_model.dart';

class AuthDataProvider {
  static final String _baseUrl = "http://192.168.137.1:3000/api";

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
      return Token.fromJson(jsonDecode("Failure"));
      // throw Exception("Failed to create account");
    }
  }

Future<Token> signIn(User user) async {
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
      return Token.fromJson(jsonDecode("Invalid Credentials"));
    }
    {
      return Token.fromJson(jsonDecode("Failure"));
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
    }
    else{
      return 'Failure';
    }
    
  }

  Future<User> forgotPassword(String email) async {
    final http.Response response = await http.put(Uri.parse("$_baseUrl/auth/forgot-Password"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed try again");
    }
  }

Future<User> resetPassword(String reset_link, String password) async {
    final http.Response response = await http.put(Uri.parse("$_baseUrl/auth/reset-Password"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "password": password,
          "resetLink": reset_link
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to reset password");
    }
  }
}

 