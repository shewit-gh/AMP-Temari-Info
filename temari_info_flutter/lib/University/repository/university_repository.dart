import 'package:temari_info_flutter/University/data_provider/data_provider.dart';
import 'package:temari_info_flutter/University/model/university.dart';

class UniversityRepository {
  final UniversityDataProvider dataProvider;
  UniversityRepository({required this.dataProvider})
      : assert(dataProvider != null);

  Future<University> create(University university) async {
    return this.dataProvider.create(university);
  }

  Future<University> update(String id, University university) async {
    return this.dataProvider.update(id, university);
  }

  Future<List> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }

  Future<List> fetchByCode(String id) async {
    return this.dataProvider.fetchByCode(id);
  }

  Future<List> fetchByName(String univName) async {
    return this.dataProvider.fetchByName(univName);
  }


}
