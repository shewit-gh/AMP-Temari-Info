import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/institute/model/institute_model.dart';

abstract class EditInstEvent extends Equatable {
  const EditInstEvent();
}

class InstituteUpdate extends EditInstEvent {
  final Institute institute;
  final String id;

  const InstituteUpdate(this.id, this.institute);

  @override
  List<Object> get props => [Institute];

  @override
  String toString() => 'University Created {University: $institute}';
}