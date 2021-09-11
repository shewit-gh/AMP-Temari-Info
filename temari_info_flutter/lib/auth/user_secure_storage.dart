import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';


class UserSecureStorage{
  static final _storage = FlutterSecureStorage();

  static const tokenKey = "token";

  static Future setToken(String token) async {
  await _storage.write(key: tokenKey, value: token);
  final Map current = Jwt.parseJwt(token);
      print(current);
  await _storage.write(key: "username", value:current['username']);
  await _storage.write(key: "email", value:current['email']);
  await _storage.write(key: "id", value:current['user_id']);
  }

  static  Future<String?> getToken() async =>
  await  _storage.read(key: tokenKey);

  static Future<String?> getUsername() async =>
  await _storage.read(key: 'username');

  static Future<String?> getEmail() async =>
  await _storage.read(key: 'email');

  static Future<String?> getId() async =>
  await _storage.read(key: 'id');
   
  static Future deleteToken() async =>
  await _storage.deleteAll();
   
  
}