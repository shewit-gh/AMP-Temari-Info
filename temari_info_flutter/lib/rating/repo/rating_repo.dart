// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:temari_info_flutter/rating/data_provider/rating_data.dart';
import 'package:temari_info_flutter/rating/models/rating.dart';


class RatingRepo {
  final RatingDataProvider dataProvider;
  

  RatingRepo({required this.dataProvider}) : assert(dataProvider != null);

  Future<Rating> createRating(Rating rating) async {
    return dataProvider.createRating(rating);
  }

  Future<List<Rating>> getRating(String id) async {
    //todo id
    return dataProvider.getRating(id);
  }

  Future<void> deleteRating(String id) async {
    return dataProvider.deleteRating(id);
  }

  Future<void> updateRating(Rating rating, String id) async {
    return dataProvider.updateRating(rating, id);
  }
}