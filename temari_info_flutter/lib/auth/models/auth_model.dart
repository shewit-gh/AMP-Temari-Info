// import 'dart:ffi';

class User {
  final String? id;
  final String? username;
  final String email;
  final String password;
  final String? role;
  final List? comments;
  final String? rating_id;
  final String? token;
  final String? resetLink;

  User(
      {this.id,
      this.username,
      required this.email,
      required this.password,
      this.role,
      this.comments,
      this.rating_id,
      this.token,
      this.resetLink});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        role: json['role'],
        comments: json['comments'],
        rating_id: json['rating_id'],
        token: json['token'],
        resetLink: json['resetLink']);
  }
}
