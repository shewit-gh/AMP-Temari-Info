import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/departments/bloc/dept_event.dart';
import 'package:temari_info_flutter/departments/bloc/dept_state.dart';
import 'package:temari_info_flutter/departments/model/models.dart';
import 'package:temari_info_flutter/departments/repo/dept_repo.dart';

// class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
//   final DepartmentRepo deptRepo;
//   DepartmentBloc(this.deptRepo) : super(InitialState());

//   @override
//   Stream<DepartmentState> mapEventToState(DepartmentEvent event) async* {
//     if (event is GetDepartment) {
//       yield LoadingState();
//       try {
//         List<Department> department = await deptRepo.getDepartment(event.id);
//         yield LoadedDepartment(department);
//       } catch (e) {
//         yield LoadingRatingError('Error Loading Rating!');
//       }
//     } else if (event is UpdateDepartment) {
//       yield LoadingState();
//       try {
//         await deptRepo.updateDepartment(event.department, event.id);
//         yield UpdateSuccess();
//         add(GetDepartment(event.id));
//       } catch (e) {
//         yield LoadingRatingError('Error Updating Rating!');
//       }
//     } else if (event is AddDepartment) {
//       yield LoadingState();
//       try {
//         Department rating = await deptRepo.createDepartment(event.department);
//         yield AddingRatingSuccess();
//         add(GetDepartment(rating.id));
//         yield UpdateSuccess();
//       } catch (e) {
//         yield LoadingRatingError('Error Updating Rating!');
//       }
//     }
//   }
// }
//the main
// class DepartmentBloc extends Bloc<DepartmentDetail, InstituteState> {
//   final InstituteRepository instituteRepository;

//   InstituteBloc(this.instituteRepository) : super(InstituteLoading());
//   @override
//   Stream<InstituteState> mapEventToState(InstituteEvent event) async* {
//     if (event is InstituteDetail) {
//       // yield InstituteLoading();
//       try {
//         final institute =
//             await instituteRepository.fetchById(event.institute_id);

//         yield InstituteLoaded(institute);
//         // print(institute);
//       } catch (_) {
//         yield InstituteLoadFail(_);
//       }
//     }
//     if (event is InstituteCreate) {
//       try {
//         await instituteRepository.create(event.institute);
//         final institutes = await instituteRepository.fetchAll();
//         yield InstituteLoaded(institutes);
//       } catch (_) {
//         yield InstituteLoadFail(_);
//       }
//     }

// if (event is InstituteUpdate) {
//   try {
//     await instituteRepository.update(event.institute.id ?? 0, event.institute);
//     final institutes = await instituteRepository.fetchAll();
//     yield InstituteLoaded(institutes);
//   } catch (_) {
//     yield InstituteLoadFail(_);
//   }
// }

//     if (event is InstituteDelete) {
//       try {
//         await instituteRepository.delete(event.id);
//         final institutes = await instituteRepository.fetchAll();
//         yield InstituteLoaded(institutes);
//       } catch (_) {
//         yield InstituteLoadFail(_);
//       }
//     }
//   }
// }

//department add
class DeptAddBloc extends Bloc<DepartmentAddEvent, DeptAddState> {
  final DepartmentRepo departmentRepository;

  DeptAddBloc(this.departmentRepository) : super(DeptAddLoading());

  @override
  Stream<DeptAddState> mapEventToState(DepartmentAddEvent event) async* {
    if (event is DepartmentAdd) {
      try {
        //await universityRepository.create(event.university);

        final department =
            await departmentRepository.createDepartment(event.department);
        //await InstituteRepository.fetchAll();
        print(department);
        yield DeptAddSuccess(department);
      } catch (_) {
        print("failed to post");
        yield DeptAddFailure();
      }
    }
  }
}
