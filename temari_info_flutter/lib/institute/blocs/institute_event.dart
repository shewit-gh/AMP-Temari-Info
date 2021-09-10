import 'package:temari_info_flutter/institute/blocs/institute_state.dart';
import 'package:flutter/material.dart';
import 'package:temari_info_flutter/institute/model/institute_model.dart';

abstract class InstituteEvent {}


class InstituteDetail extends InstituteEvent {
  final String institute_id;
  InstituteDetail(this.institute_id);
  
  @override
  List<Object> get props => [];
}

class InstituteCreate extends InstituteEvent {
  final Institute institute;

  InstituteCreate(this.institute);

  @override
  List<Object> get props => [institute];

  @override
  String toString() => 'Institute Created {Institute: $institute}';
}

class InstituteUpdate extends InstituteEvent {
  final Institute institute;

  InstituteUpdate(this.institute);

  @override
  List<Object> get props => [institute];

  @override
  String toString() => 'Institute Updated {Institute: $institute}';
}

class InstituteDelete extends InstituteEvent {
  final String id;

  InstituteDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Institute Deleted {Institute Id: $id}';
}
