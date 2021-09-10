
import 'package:temari_info_flutter/comment/data_provider/comment_data.dart';
import 'package:temari_info_flutter/comment/models/models.dart';

class CommentRepo2 {
  final CommentDataProvider dataProvider;

  CommentRepo2({required this.dataProvider});

  
  Future<Comment> createComment(Comment comment) async {
      return dataProvider.createComment(comment);
  }
  

  Future<List<Comment>> getComment(String id) async {
    return dataProvider.getComment(id);
  }

  Future<void> deleteComment(Comment comment) async {
    return dataProvider.deleteComment(comment);
  }

  Future<void> updateComment(Comment comment, String id) async {
   return dataProvider.updateComment(comment, id);
  }
  
}