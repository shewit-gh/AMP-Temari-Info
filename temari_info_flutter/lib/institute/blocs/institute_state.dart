import 'package:temari_info_flutter/institute/model/institute_model.dart';

abstract class InstituteState {
  const InstituteState();
  @override
  List<Object> get props => [];
}

class InstituteLoading extends InstituteState {}

class InstituteLoaded extends InstituteState {
  final List institute;
  InstituteLoaded([this.institute = const []]);

  @override
  List<Object> get props => [institute];
}

class InstituteLoadFail extends InstituteState {
  final Object error;
  InstituteLoadFail(this.error);
}

//institute add state
abstract class InstAddState {
  const InstAddState();
  @override
  List<Object> get props => [];
}

class InstAddLoading extends InstAddState {}

class InstAddSuccess extends InstAddState {
  final Institute inst;
  InstAddSuccess(this.inst);
}

class InstAddFailure extends InstAddState {}
