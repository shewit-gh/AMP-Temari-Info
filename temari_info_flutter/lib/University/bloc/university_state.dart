import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/University/model/university.dart';

abstract class UniversityState {
  const UniversityState();

  @override
  List<Object> get props => [];
}

class UniversityLoading extends UniversityState {}

class UniversityOperationSuccess extends UniversityState {
  final List Universitys;

  UniversityOperationSuccess([this.Universitys = const []]);

  @override
  List<Object> get props => [Universitys];
}

class UniversityOperationFailure extends UniversityState {}
