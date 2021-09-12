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

//department add
abstract class DepartmentAddEvent extends Equatable {
  const DepartmentAddEvent();
}

class DepartmentAdd extends DepartmentAddEvent {
  final Department department;

  const DepartmentAdd(this.department);

  @override
  List<Object> get props => [department];

  @override
  String toString() => 'department Created {University: $department}';
}
