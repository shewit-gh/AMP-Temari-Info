import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/comment/models/comment.dart';
import 'package:temari_info_flutter/comment/models/models.dart';

abstract class CommentEvent extends Equatable{
  const CommentEvent();
  @override
  List<Object?> get props => [];
}

class AddComment extends CommentEvent {
  
  final Comment comment;
  const AddComment({required this.comment});
}

class GetComment extends CommentEvent {
  final String id;

  GetComment(this.id); 
}

class UpdateComment extends CommentEvent{
  final String id;
  final Comment comment;
  UpdateComment(this.id, this.comment);
  @override
  List<Object> get props =>[Comment];

}
class DeleteComment extends CommentEvent{
  final  Comment comment ;
  final int id;
  DeleteComment(this.comment ,this.id);
  @override 
  List<Object> get props => [Comment];

 
}



