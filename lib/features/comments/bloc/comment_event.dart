part of 'comment_bloc.dart';

abstract class CommentEvent {}

class FetchComments extends CommentEvent {
  FetchComments();
}
