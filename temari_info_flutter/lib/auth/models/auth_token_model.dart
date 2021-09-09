// import 'dart:ffi';

class Token {
  final String value;
  
  Token(
      {
      required this.value,
      });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        
        value: json['token'],
        );
  }
}
