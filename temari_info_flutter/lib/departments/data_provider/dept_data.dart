// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
//import 'dart:io';

//import 'package:meta/meta.dart';
import 'package:temari_info_flutter/departments/bloc/dept_event.dart';
import 'package:temari_info_flutter/departments/model/dept.dart';
import 'package:http/http.dart' as http;
//import 'package:path/path.dart';

class DepartmentDataProvider {
  final http.Client httpClient;
  final _baseUrl = 'http://10.0.2.2:3000/api/Rating';

  DepartmentDataProvider({required this.httpClient})
      : assert(httpClient != null);

  Future<Department> createDepartment(Department department) async {
    final response = await httpClient.post(
      Uri.parse("$_baseUrl/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'dept_name': department.dept_name,
        'years': department.years,
        'institute_id': department.institute_id,
        "objective": department.objective,
      }),
    );

    if (response.statusCode == 201) {
      return Department.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create department');
    }
  }

  Future<List<Department>> GetDepartment(String id) async {
    final response = await httpClient.get(Uri.parse('$_baseUrl'));

    if (response.statusCode == 200) {
      final department = jsonDecode(response.body)['data'] as List;
      return department
          .map((department) => Department.fromJson(department))
          .toList();
    } else {
      throw Exception('Failed to fetch department');
    }
  }

  Future<void> deleteDepartment(String id) async {
    final http.Response response = await httpClient.delete(
      Uri.parse('$_baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete department.');
    }
  }

  Future<void> UpdateDepartment(Department department, String id) async {
    final http.Response response = await httpClient.patch(
      Uri.parse('$_baseUrl/${department.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': department.id,
        'dept_name': department.dept_name,
        'years': department.years,
        'university_id': department.institute_id,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update department.');
    }
  }
}
