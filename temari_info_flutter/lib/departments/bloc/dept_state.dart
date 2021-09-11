import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/departments/model/models.dart';

class DepartmentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends DepartmentState {}

class LoadingState extends DepartmentState {}

class LoadedDepartment extends DepartmentState {
  final List<Department> department;

  LoadedDepartment(this.department);
}

class UpdateSuccess extends DepartmentState {}

class AddingRatingSuccess extends DepartmentState {}

class LoadingRatingError extends DepartmentState {
  final String message;

  LoadingRatingError(this.message);
}

class LoadedState extends DepartmentState {}
