import 'package:temari_info_flutter/institute/blocs/institute_state.dart';
import 'package:temari_info_flutter/institute/blocs/institute_event.dart';
import 'package:temari_info_flutter/institute/repo/institute_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstituteBloc extends Bloc<InstituteDetail, InstituteState> {
  final InstituteRepository instituteRepository;

  InstituteBloc(this.instituteRepository) : super(InstituteUnloaded());
  @override
  Stream<InstituteState> mapEventToState(InstituteEvent event) async* {
    if (event is InstituteDetail) {
      try {
        yield InstituteLoading();
        final institute =
            await instituteRepository.fetchById(event.institute_id);
        yield InstituteLoaded(institute);
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
