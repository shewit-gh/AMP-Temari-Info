import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:temari_info_flutter/University/repository/university_repository.dart';

import 'University_event.dart';
import 'University_state.dart';

// class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
//   final UniversityRepository universityRepository;

//   UniversityBloc(this.universityRepository) : super(UniversityLoading());

//   @override
//   Stream<UniversityState> mapEventToState(UniversityEvent event) async* {
//     if (event is UniversityLoad) {
//       yield UniversityLoading();
//       try {
//         final universitys = await universityRepository.fetchAll();
//         print(universitys);
//         yield UniversityOperationSuccess(universitys);
//       } catch (_) {
//         yield UniversityOperationFailure();
//       }
//     }

//     if (event is UniversityCreate) {
//       try {
//         await universityRepository.create(event.university);
//         final Universitys = await universityRepository.fetchAll();
//         yield UniversityOperationSuccess(Universitys);
//       } catch (_) {
//         yield UniversityOperationFailure();
//       }
//     }

//     if (event is UniversityUpdate) {
//       try {
//         await universityRepository.update(
//             event.university.id ?? 0, event.university);
//         final Universitys = await universityRepository.fetchAll();
//         yield UniversityOperationSuccess(Universitys);
//       } catch (_) {
//         yield UniversityOperationFailure();
//       }
//     }

//     if (event is UniversityDelete) {
//       try {
//         await universityRepository.delete(event.id);
//         final Universitys = await universityRepository.fetchAll();
//         yield UniversityOperationSuccess(Universitys);
//       } catch (_) {
//         yield UniversityOperationFailure();
//       }
//     }
//   }
// }

// class UniBloc extends Bloc<UniversityEvent, UniversityState> {
//   UniBloc() : super(UniversityLoading());

//   @override
//   Stream<UniversityState> mapEventToState(UniversityEvent event) async* {}
// }
