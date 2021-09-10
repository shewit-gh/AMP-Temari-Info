import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/University/model/university.dart';

abstract class UniversityEvent extends Equatable {
  const UniversityEvent();
}
class UniversityListLoad extends UniversityEvent {
  const UniversityListLoad();

  @override
  List<Object> get props => [];
}


class UniversityLoad extends UniversityEvent {
  final String id;

  // const UniversityLoad();

   const UniversityLoad(this.id);

  @override
  List<Object> get props => [];
}

class UniversityCreate extends UniversityEvent {
  final University university;

  const UniversityCreate(this.university);

  @override
  List<Object> get props => [University];

  @override
  String toString() => 'University Created {University: $university}';
}

class UniversityUpdate extends UniversityEvent {
  final University university;

  const UniversityUpdate(this.university);

  @override
  List<Object> get props => [university];

  @override
  String toString() => 'University Updated {University: $university}';
}

class UniversityDelete extends UniversityEvent {
  final int id;

  const UniversityDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'University Deleted {University Id: $id}';
}
