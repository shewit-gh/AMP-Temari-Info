import 'package:temari_info_flutter/institute/blocs/institute_state.dart';
import 'package:temari_info_flutter/institute/blocs/institute_event.dart';
import 'package:temari_info_flutter/institute/repo/institute_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstituteBloc extends Bloc<InstituteDetail, InstituteState> {
  final InstituteRepository instituteRepository;

  InstituteBloc(this.instituteRepository) : super(InstituteLoading());
  @override
  Stream<InstituteState> mapEventToState(InstituteEvent event) async* {
    if (event is InstituteDetail) {
      // yield InstituteLoading();
      try {
        final institute =
            await instituteRepository.fetchById(event.institute_id);

        yield InstituteLoaded(institute);
        // print(institute);
      } catch (_) {
        yield InstituteLoadFail(_);
      }
    }
    if (event is InstituteCreate) {
      try {
        await instituteRepository.create(event.institute);
        final institutes = await instituteRepository.fetchAll();
        yield InstituteLoaded(institutes);
      } catch (_) {
        yield InstituteLoadFail(_);
      }
    }

    // if (event is InstituteUpdate) {
    //   try {
    //     await instituteRepository.update(event.institute.id ?? 0, event.institute);
    //     final institutes = await instituteRepository.fetchAll();
    //     yield InstituteLoaded(institutes);
    //   } catch (_) {
    //     yield InstituteLoadFail(_);
    //   }
    // }

    if (event is InstituteDelete) {
      try {
        await instituteRepository.delete(event.id);
        final institutes = await instituteRepository.fetchAll();
        yield InstituteLoaded(institutes);
      } catch (_) {
        yield InstituteLoadFail(_);
      }
    }
  }
}

//institute post bloc
class InstAddBloc extends Bloc<InstituteAddEvent, InstAddState> {
  final InstituteRepository instituteRepository;

  InstAddBloc(this.instituteRepository) : super(InstAddLoading());

  @override
  Stream<InstAddState> mapEventToState(InstituteAddEvent event) async* {
    if (event is InstituteAdd) {
      try {
        //await universityRepository.create(event.university);

        final institute = await instituteRepository.create(event.institute);
        //await InstituteRepository.fetchAll();
        print(institute);
        yield InstAddSuccess(institute);
      } catch (_) {
        print("failed to post");
        yield InstAddFailure();
      }
    }
    // if (event is SearchRefresh){
    //   yield (UnivSearchLoading());
    // }
  }
}
