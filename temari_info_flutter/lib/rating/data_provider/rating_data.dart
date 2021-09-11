// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:temari_info_flutter/rating/models/rating.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class RatingDataProvider {
  final http.Client httpClient;
  final _baseUrl = 'http://10.0.2.2:3000/api/Rating';

  RatingDataProvider({required this.httpClient}) : assert(httpClient != null);

  Future<Rating> createRating(Rating rating) async {
    final response = await httpClient.post(
      Uri.parse("$_baseUrl/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'rating': rating.rating,
        'user_id': rating.user_id,
        'university_id': rating.university_id,
      }),
    );

    if (response.statusCode == 200) {
      return Rating.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create rating');
    }
  }

  Future<List<Rating>> getRating(String id) async {
    final response = await httpClient.get(Uri.parse('$_baseUrl'));

    if (response.statusCode == 200) {
      final rating = jsonDecode(response.body)['data'] as List;
      return rating.map((rating) => Rating.fromJson(rating)).toList();
    } else {
      throw Exception('Failed to fetch rating');
    }
  }

  Future<void> deleteRating(String id) async {
    final http.Response response = await httpClient.delete(
      Uri.parse('$_baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete rating.');
    }
  }

  Future<void> updateRating(Rating rating, String id) async {
    final http.Response response = await httpClient.patch(
      Uri.parse('$_baseUrl/${rating.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': rating.id,
        'rating': rating.rating,
        'user_id': rating.user_id,
        'university_id': rating.university_id,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update rating.');
    }
  }
}
