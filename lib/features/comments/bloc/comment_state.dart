part of 'comment_bloc.dart';

abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<Comment> comments;
  final bool isMaskedEmail;

  CommentLoaded({required this.comments, required this.isMaskedEmail});
}

class CommentError extends CommentState {
  final String message;

  CommentError(this.message);
}