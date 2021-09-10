import 'package:temari_info_flutter/institute/data_provider/institute_data.dart';
import 'package:temari_info_flutter/institute/model/institute_model.dart';

class InstituteRepository {
  final InstituteDataProvider dataProvider;
  InstituteRepository({required this.dataProvider});

  Future<Institute> create(Institute institute) async {
    return this.dataProvider.create(institute);
  }

  Future<Institute> update(String id, Institute institute) async {
    return this.dataProvider.update(id, institute);
  }

  Future<List> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<List> fetchById(String id) async {
    return this.dataProvider.fetchById(id);
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
