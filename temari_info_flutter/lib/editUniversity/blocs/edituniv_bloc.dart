import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/editUniversity/blocs/editUniv_event.dart';
import 'package:temari_info_flutter/editUniversity/blocs/edituniv_state.dart';
import 'package:temari_info_flutter/editUniversity/repo/editUnivrepo.dart';

class EditUnivBloc extends Bloc<EditUnivEvent, UnivEditState> {
  final UniversityRepository universityRepository;

  EditUnivBloc(this.universityRepository) : super(EditUnivLoading());

  @override
  Stream<UnivEditState> mapEventToState(EditUnivEvent event) async* {
    
    if (event is UniversityUpdate) {
      try {
        //await universityRepository.create(event.university);
        final Universitys =
          await universityRepository.update(event.id, event.university);
          await universityRepository.fetchAll();
        // print(Universitys);
        yield EditUnivSuccess(Universitys);
      } catch (_) {
        print("fao");
        yield EditUnivFailure();
      }
    }
    // if (event is SearchRefresh){
    //   yield (UnivSearchLoading());
    // }
  }
}
