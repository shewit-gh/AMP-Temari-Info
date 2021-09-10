import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:temari_info_flutter/comment/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentDataProvider {
  final http.Client httpClient;
  final _baseUrl = 'http://192.168.56.1:3000/api/Comment';

  CommentDataProvider({required this.httpClient}) : assert(httpClient != null);

  Future<Comment> createComment(Comment comment) async {
    final response = await httpClient.post(
      Uri.http('$_baseUrl', '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'comment': comment.comment,
        'university_id': comment.university_id,
        'user_id': comment.user_id
        
      }),
    );

    if (response.statusCode == 201) {
      return Comment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create comment.');
    }
  }

  Future<List<Comment>> getComment(String id) async {
    final response = await httpClient.get(Uri.parse('$_baseUrl/Comment'));

    if (response.statusCode == 200) {
      final comment = jsonDecode(response.body)['data'] as List;
      return comment.map((comment) => Comment.fromJson(comment)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<void> deleteComment(Comment comment) async {
    final http.Response response = await httpClient.delete(
     Uri.parse( '$_baseUrl/comment/${comment.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete comment.');
    }
  }

  Future<void> updateComment(Comment comment, String id) async {
    final http.Response response = await httpClient.patch(
     Uri.parse( '$_baseUrl/comment/${comment.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': comment.id,
        'comment': comment.comment,
        'user_id': comment.user_id,
        'university_id': comment.university_id,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update comment.');
    }
  }
}