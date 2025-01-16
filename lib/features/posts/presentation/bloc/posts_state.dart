part of 'posts_bloc.dart';

abstract class PostsState {
  const PostsState();
}

class PostsInitialState extends PostsState {}

class PostsLoadingState extends PostsState {}

class ErrorGetPostsState extends PostsState{
  final String errorMessage;

  ErrorGetPostsState(this.errorMessage);
}

class SuccessGetPostsState extends PostsState{
  final List<PostModel> postsList;

  SuccessGetPostsState(this.postsList);
}