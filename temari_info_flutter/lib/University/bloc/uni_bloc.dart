import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/University/bloc/blocs.dart';
import 'package:temari_info_flutter/University/repository/university_repository.dart';

class UniBloc extends Bloc<UniversityEvent, UniversityState> {
  final UniversityRepository universityRepository;

  UniBloc(this.universityRepository) : super(UniversityLoading());

  @override
  Stream<UniversityState> mapEventToState(UniversityEvent event) async* {
    if (event is UniversityListLoad) {
      // yield UniversityLoading()
      try {
        final universitys = await universityRepository.fetchAll();
        // print(universitys);
        yield UniversityOperationSuccess(universitys);
      } catch (_) {
        yield UniversityOperationFailure();
      }
    }

    if (event is UniversityLoad) {
      // yield UniversityLoading();
      try {
        final universitys = await universityRepository.fetchByCode(event.id);
        // print(universitys);
        yield UniversityOperationSuccess(universitys);
      } catch (_) {
        yield UniversityOperationFailure();
      }
    }

    

    // if (event is UniversityUpdate) {
    //   try {
    //     await universityRepository.update(
    //         event.id, event.university);
    //     final Universitys = await universityRepository.fetchAll();
    //     yield UniversityOperationSuccess(Universitys);
    //   } catch (_) {
    //     yield UniversityOperationFailure();
    //   }
    // }

    if (event is UniversityDelete) {
      try {
        await universityRepository.delete(event.id);
        final Universitys = await universityRepository.fetchAll();
        yield UniversityOperationSuccess(Universitys);
      } catch (_) {
        yield UniversityOperationFailure();
      }
    }
  }
}

//Search result page bloc
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final UniversityRepository universityRepository;

  SearchBloc(this.universityRepository) : super(UnivSearchLoading());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is UnivSearchLoad) {
      // yield UniversityLoading()
      try {
        final universitys =
            await universityRepository.fetchByName(event.univName);
        // print(universitys);
        yield UnivSearchSuccess(universitys);
      } catch (_) {
        yield UnivSearchFailure();
      }
    }
    // if (event is SearchRefresh){
    //   yield (UnivSearchLoading());
    // }
  }
}

//university add bloc
class UnivAddBloc extends Bloc<UniversityAddEvent, UnivAddState> {
  final UniversityRepository universityRepository;

  UnivAddBloc(this.universityRepository) : super(UnivAddLoading());

  @override
  Stream<UnivAddState> mapEventToState(UniversityAddEvent event) async* {
    if (event is UniversityCreate) {
      try {
        //await universityRepository.create(event.university);

        final Universitys = await universityRepository.create(event.university);
        await universityRepository.fetchAll();
        print(Universitys);
        yield UnivAddSuccess(Universitys);
      } catch (_) {
        print("fao");
        yield UnivAddFailure();
      }
    }
  }
}
//univ fetch bloc home

class UnivFetchBloc extends Bloc<UniversityFetchEvent, UniversityFetchState> {
  final UniversityRepository universityRepository;

  UnivFetchBloc(this.universityRepository) : super(UnivFetching());

  @override
  Stream<UniversityFetchState> mapEventToState(
      UniversityFetchEvent event) async* {
    if (event is UniversityFetch) {
      // yield UniversityLoading()
      try {
        final universitys = await universityRepository.fetchAll();
        // print(universitys);
        yield UniversityFetchSuccess(universitys);
      } catch (_) {
        yield UniversityFetchFailure();
      }
    }
  }
}
