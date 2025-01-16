part of 'posts_bloc.dart';

abstract class PostsEvent {
  const PostsEvent();
}

// On Fetching Posts Event
class OnGettingPostsEvent extends PostsEvent {
  final bool withLoading;

  OnGettingPostsEvent({this.withLoading = true});
}