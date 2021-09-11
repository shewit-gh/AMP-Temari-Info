
import 'package:temari_info_flutter/editUniversity/model/editunivmodel.dart';

abstract class UnivEditState {
  const UnivEditState();
  @override
  List<Object> get props => [];
}

class EditUnivLoading extends UnivEditState {}

class EditUnivSuccess extends UnivEditState {
  final University univ;
  EditUnivSuccess(this.univ);
}

class EditUnivFailure extends UnivEditState {}