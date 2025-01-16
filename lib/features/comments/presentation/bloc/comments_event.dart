part of 'comments_bloc.dart';

abstract class CommentsEvent {
  const CommentsEvent();
}

class OnGettingCommentsEvent extends CommentsEvent {
  final int postId;
  final bool withLoading;

  OnGettingCommentsEvent(this.postId, {this.withLoading = true});
}
