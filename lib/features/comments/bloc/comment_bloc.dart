import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingo_panda_assignment/features/comments/models/comment.dart';
import 'package:lingo_panda_assignment/features/comments/services/comment_services.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  // Defining a list of comments
  // this if for future use. For example to delete, add, pagination etc.
  List<Comment> comments = [];

  CommentBloc() : super(CommentInitial()) {
    on<FetchComments>(_fetchComments);
  }

  void _fetchComments(FetchComments event, emit) async {
    emit (CommentLoading());
     try {
       final bool isMaskedEmail = await CommentServices().isMaskedEmail();
       final comments = await CommentServices().fetchComments();
       if(comments != null) {
         emit (CommentLoaded(comments: comments, isMaskedEmail: isMaskedEmail));
       } else {
         emit (CommentError('Failed to fetch comments'));
       }
     } catch (e) {
       emit (CommentError(e.toString()));
     }
  }
}