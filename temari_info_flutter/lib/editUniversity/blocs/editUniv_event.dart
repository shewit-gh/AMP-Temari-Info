import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/editUniversity/model/editunivmodel.dart';

abstract class EditUnivEvent extends Equatable {
  const EditUnivEvent();
}

class UniversityUpdate extends EditUnivEvent {
  final University university;
  final String id;

  const UniversityUpdate(this.id, this.university);

  @override
  List<Object> get props => [University];

  @override
  String toString() => 'University Created {University: $university}';
}
