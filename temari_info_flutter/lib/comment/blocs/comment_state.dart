import 'package:equatable/equatable.dart';
import 'package:temari_info_flutter/comment/models/models.dart';
import 'package:temari_info_flutter/comment/models/comment.dart';

class CommentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends CommentState {}

class LoadingState extends CommentState {}

class LoadedComment extends CommentState {
  final List<Comment> comment;
  LoadedComment(this.comment);
  List<Object> get props=>[this.comment];
}

class UpdateSuccess extends CommentState {
  final String comment;
  UpdateSuccess(this.comment);
}

class AddingCommentSuccess extends CommentState {}

class LoadingCommentError extends CommentState {
  final String message;

  LoadingCommentError(this.message);
}

class LoadedState extends CommentState {}