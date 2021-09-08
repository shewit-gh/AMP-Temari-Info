import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Rating extends Equatable {
  Rating(
      {required this.id,
      required this.rating,
      required this.user_id,
      required this.university_id});

  final String id;
  final int rating;
  final String user_id;
  final String university_id;

  @override
  List<Object> get props => [id, rating, user_id, university_id];

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      rating: json['rating'],
      user_id: json['user_id'],
      university_id: json['university_id'],
      
    );
  }

  @override
  String toString() => 'Rating { id: $id, rating: $rating, university_id: $university_id }';
}