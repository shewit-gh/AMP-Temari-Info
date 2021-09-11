import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:temari_info_flutter/University/model/university.dart';

class UniversityDataProvider {
  final http.Client httpClient;
  static final String _baseUrl = "http://10.0.2.2:3000/api/University";

  UniversityDataProvider({required this.httpClient})
      : assert(httpClient != null);
  Future<University> create(University university) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "univ_name": university.univ_name,
          "short_name": university.short_name,
          "location": university.location,
          "description": university.description,
          "institute": university.institute,
          "comment": university.comment,
          "rating": university.rating
        }));

    if (response.statusCode == 201) {
      return University.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create university");
    }
  }

  Future<List> fetchByCode(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    return [jsonDecode(response.body)];

    // if (response.statusCode == 200) {
    //   return University.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception("Fetching university by code failed");
    // }
  }

  Future<List> fetchByName(String UnivName) async {
    final response = await http.get(Uri.parse("$_baseUrl/search/$UnivName"));

    return [jsonDecode(response.body)];

    
  }

  Future<List> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final university = jsonDecode(response.body) as List;
      return university;
    } else {
      throw Exception("Could not fetch universities");
    }
  }

  Future<University> update(int id, University university) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "univ_name": university.univ_name,
          "short_name": university.short_name,
          "location": university.location,
          "description": university.description,
          "institute": university.institute,
          "comment": university.comment,
          "rating": university.rating
        }));

    if (response.statusCode == 200) {
      return University.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the university");
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the university");
    }
  }
}
