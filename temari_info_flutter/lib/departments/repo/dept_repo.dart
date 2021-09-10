// ignore_for_file: unnecessary_null_comparison

//import 'dart:io';

import 'package:temari_info_flutter/departments/data_provider/dept_data.dart';
import 'package:temari_info_flutter/departments/model/dept.dart';

class DepartmentRepo {
  final DepartmentDataProvider dataProvider;

  DepartmentRepo({required this.dataProvider}) : assert(dataProvider != null);

  Future<Department> createDepartment(Department Department) async {
    return dataProvider.createDepartment(Department);
  }

  Future<List<Department>> getDepartment(String id) async {
    //todo id
    return dataProvider.GetDepartment(id);
  }

  Future<void> deleteDepartment(String id) async {
    return dataProvider.deleteDepartment(id);
  }

  Future<void> updateDepartment(Department Department, String id) async {
    return dataProvider.UpdateDepartment(Department, id);
  }
}
