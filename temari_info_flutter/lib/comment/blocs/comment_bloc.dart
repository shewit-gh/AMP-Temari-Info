import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/comment/blocs/comment_event.dart';
import 'package:temari_info_flutter/comment/blocs/comment_state.dart';
import 'package:temari_info_flutter/comment/models/models.dart';
import 'package:temari_info_flutter/comment/repo/comment_repo2.dart';
// import 'package:temari_info_flutter/presentation/university/university_screen.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepo2 commentRepo;

  CommentBloc({ required this.commentRepo}):super(InitialState());

  @override
   Stream<CommentState> mapEventToState(CommentEvent event) async* {
   
    if(event is GetComment) {
      yield LoadingState();
      try {
        List<Comment> comment = await commentRepo.getComment(event.id);
        yield LoadedComment(comment);
      } catch (e) {
        yield LoadingCommentError('Error Loading Commnet!');
      }
    }
    else if(event is UpdateComment) {
      yield LoadingState();
      try {
        await commentRepo.updateComment(event.comment, event.id);
        yield UpdateSuccess(event.comment.comment);
        add(GetComment(event.id));
      } catch (e) {
        yield LoadingCommentError('Error Updating Comment!');
      }
    }
    else if(event is AddComment) {
      yield LoadingState();
      try {
      Comment comment = await commentRepo.createComment(event.comment);
      yield AddingCommentSuccess();
      add(GetComment(event.comment.university_id));
        yield UpdateSuccess(event.comment.comment);
      } catch (e) {
        yield LoadingCommentError('Error Adding Comment!');
      }
      
    }
    else if(event is DeleteComment){
      try {
              await commentRepo.deleteComment(event.comment);
      
      } catch (e) {
       yield LoadingCommentError('Error Delete Comment!');
      }
      }
    }

  }

