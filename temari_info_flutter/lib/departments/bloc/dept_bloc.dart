import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/departments/bloc/dept_event.dart';
import 'package:temari_info_flutter/departments/bloc/dept_state.dart';
import 'package:temari_info_flutter/departments/model/models.dart';
import 'package:temari_info_flutter/departments/repo/dept_repo.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final DepartmentRepo deptRepo;
  DepartmentBloc(this.deptRepo) : super(InitialState());

  @override
  Stream<DepartmentState> mapEventToState(DepartmentEvent event) async* {
    if (event is GetDepartment) {
      yield LoadingState();
      try {
        List<Department> department = await deptRepo.getDepartment(event.id);
        yield LoadedDepartment(department);
      } catch (e) {
        yield LoadingRatingError('Error Loading Rating!');
      }
    } else if (event is UpdateDepartment) {
      yield LoadingState();
      try {
        await deptRepo.updateDepartment(event.department, event.id);
        yield UpdateSuccess();
        add(GetDepartment(event.id));
      } catch (e) {
        yield LoadingRatingError('Error Updating Rating!');
      }
    } else if (event is AddDepartment) {
      yield LoadingState();
      try {
        Department rating = await deptRepo.createDepartment(event.department);
        yield AddingRatingSuccess();
        add(GetDepartment(rating.id));
        yield UpdateSuccess();
      } catch (e) {
        yield LoadingRatingError('Error Updating Rating!');
      }
    }
  }
}
