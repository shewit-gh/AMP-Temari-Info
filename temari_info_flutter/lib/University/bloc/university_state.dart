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

class UniversityPosted extends UniversityState {
  final University univ;
  UniversityPosted(this.univ);
}

//search page state
abstract class SearchState {
  const SearchState();
  @override
  List<Object> get props => [];
}

class UnivSearchLoading extends SearchState {}

class UnivSearchSuccess extends SearchState {
  final List Universitys;

  UnivSearchSuccess([this.Universitys = const []]);

  @override
  List<Object> get props => [Universitys];
}

class UnivSearchFailure extends SearchState {}
