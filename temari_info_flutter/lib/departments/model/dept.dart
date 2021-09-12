import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Department extends Equatable {
  Department(
      {this.id, this.dept_name, this.years, this.institute_id, this.objective});

  final String? id;
  final String? dept_name;
  final String? years;
  final String? institute_id;
  final String? objective;

  @override
  List<String> get props => [];

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      dept_name: json['dept_name'],
      years: json['years'],
      institute_id: json['institute_id'],
      objective: json["objective"],
    );
  }

  @override
  String toString() =>
      'Rating { id: $id, rating: $dept_name,years:$years institute_id: $institute_id }';
}
