import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/departments/model/models.dart';

class DepartmentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddDepartment extends DepartmentEvent {
  final Department department;

  AddDepartment(this.department);
}

class GetDepartment extends DepartmentEvent {
  final String id;

  GetDepartment(this.id);
}

class UpdateDepartment extends DepartmentEvent {
  final String id;
  final Department department;

  UpdateDepartment(this.id, this.department);
}
