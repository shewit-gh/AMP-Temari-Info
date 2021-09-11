import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/editInstitute/bloc/edit_inst_event.dart';
import 'package:temari_info_flutter/editInstitute/bloc/edit_inst_state.dart';
import 'package:temari_info_flutter/editInstitute/repo/edit_inst_repo.dart';

class EditInstBloc extends Bloc<EditInstEvent, InstEditState> {
  final InstituteRepository instituteRepository;

  EditInstBloc(this.instituteRepository) : super(EditInstLoading());

  @override
  Stream<InstEditState> mapEventToState(EditInstEvent event) async* {
    
    if (event is InstituteUpdate) {
      try {
        //await universityRepository.create(event.university);
        final institute =
          await instituteRepository.update(event.id, event.institute);
          await instituteRepository.fetchAll();
        // print(Universitys);
        yield EditInstSuccess(institute);
      } catch (_) {
        print("fao");
        yield EditInstFailure();
      }
    }
    // if (event is SearchRefresh){
    //   yield (UnivSearchLoading());
    // }
  }
}