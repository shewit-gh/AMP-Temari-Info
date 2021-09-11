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

// class UniversityUpdate extends UniversityEvent {
//   final University university;
//   final String id;

//   const UniversityUpdate(this.id, this.university);

//   @override
//   List<Object> get props => [university];

//   @override
//   String toString() => 'University Updated {University: $university}';
// }

class UniversityDelete extends UniversityEvent {
  final String id;

  const UniversityDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'University Deleted {University Id: $id}';
}

//Search result page event

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

// class SearchRefresh extends SearchEvent{
//   const SearchRefresh();
//    @override
//   List<Object> get props => [];
// }
class UnivSearchLoad extends SearchEvent {
  final String univName;

  // const UniversityLoad();

  const UnivSearchLoad(this.univName);

  @override
  List<Object> get props => [];
}

//univ add event
abstract class UniversityAddEvent extends Equatable {
  const UniversityAddEvent();
}

class UniversityCreate extends UniversityAddEvent {
  final University university;

  const UniversityCreate(this.university);

  @override
  List<Object> get props => [University];

  @override
  String toString() => 'University Created {University: $university}';
}
