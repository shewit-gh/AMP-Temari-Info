import 'dart:convert';

import 'package:temari_info_flutter/institute/model/institute_model.dart';

import 'package:http/http.dart' as http;

class InstituteDataProvider {
  static final String _baseUrl = "http://10.0.2.2:3000/api/Institute";
  final http.Client httpClient;
  InstituteDataProvider({required this.httpClient});

  Future<Institute> create(Institute institute) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "univ_id": institute.univ_id,
          "inst_name": institute.inst_name,
          "phone": institute.phone,
          "email": institute.email,
          "inst_description": institute.inst_description
        }));

    if (response.statusCode == 201) {
      return Institute.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create institute");
    }
  }

  Future<List> fetchById(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));
    return [jsonDecode(response.body)];
  //   if (response.statusCode == 200) {
  //     return Institute.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception("Failed to fetch institute");
  //   }
  }

  Future<List> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final institutes = jsonDecode(response.body) as List;
      return institutes;
    } else {
      throw Exception("Could not fetch institutes");
    }
  }

  Future<Institute> update(String id, Institute institute) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "univ_id": institute.univ_id,
          "inst_name": institute.inst_name,
          "phone": institute.phone,
          "email": institute.email,
          "department_id": institute.department_id,
          "inst_description": institute.inst_description,
        }));

    if (response.statusCode == 200) {
      return Institute.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the institute");
    }
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Failed to delete the institute");
    }
  }
}
