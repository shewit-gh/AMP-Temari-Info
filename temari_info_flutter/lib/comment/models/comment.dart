import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Comment extends Equatable {
  final String id;
  final String comment;
  final String user_id;
  final String university_id;
  Comment(
      {required this.id,
      required this.comment,
      required this.user_id,
      required this.university_id});


  @override
  List<Object> get props => [id, comment, user_id, university_id];

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['comment'],
      user_id: json['user_id'],
      university_id: json['university_id'],
      
    );
  }

  @override
  String toString() => 'Rating { id: $id, commnet: $comment, university_id: $university_id }';
}