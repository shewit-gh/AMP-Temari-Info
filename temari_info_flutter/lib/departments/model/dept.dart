import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Department extends Equatable {
  Department(
      {required this.id,
      required this.dept_name,
      required this.years,
      required this.institute_id});

  final String id;
  final int dept_name;
  final String years;
  final String institute_id;

  @override
  List<Object> get props => [id, dept_name, years, institute_id];

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      dept_name: json['dept_name'],
      years: json['years'],
      institute_id: json['institute_id'],
    );
  }

  @override
  String toString() =>
      'Rating { id: $id, rating: $dept_name,years:$years institute_id: $institute_id }';
}
