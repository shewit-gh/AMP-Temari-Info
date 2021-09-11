import 'package:temari_info_flutter/institute/model/institute_model.dart';

abstract class InstEditState {
  const InstEditState();
  @override
  List<Object> get props => [];
}

class EditInstLoading extends InstEditState {}

class EditInstSuccess extends InstEditState {
  final Institute inst;
  EditInstSuccess(this.inst);
}

class EditInstFailure extends InstEditState {}