import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/departments/model/models.dart';

// class DepartmentState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class InitialState extends DepartmentState {}

// class LoadingState extends DepartmentState {}

// class LoadedDepartment extends DepartmentState {
//   final List<Department> department;

//   LoadedDepartment(this.department);
// }

// class UpdateSuccess extends DepartmentState {}

// class AddingRatingSuccess extends DepartmentState {}

// class LoadingRatingError extends DepartmentState {
//   final String message;

//   LoadingRatingError(this.message);
// }

// class LoadedState extends DepartmentState {}

//the main

abstract class DepartmentState {
  const DepartmentState();
  @override
  List<Object> get props => [];
}

class DepartmentLoading extends DepartmentState {}

class DepartmentLoaded extends DepartmentState {
  final List department;
  DepartmentLoaded([this.department = const []]);

  @override
  List<Object> get props => [department];
}

class DepartmentLoadFail extends DepartmentState {
  final Object error;
  DepartmentLoadFail(this.error);
}

//department add state
abstract class DeptAddState {
  const DeptAddState();
  @override
  List<Object> get props => [];
}

class DeptAddLoading extends DeptAddState {}

class DeptAddSuccess extends DeptAddState {
  final Department dept;
  DeptAddSuccess(this.dept);
}

class DeptAddFailure extends DeptAddState {}
