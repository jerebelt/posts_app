part of 'comments_bloc.dart';

abstract class CommentsState {
  const CommentsState();
}

class CommentsInitialState extends CommentsState{

}
class CommentsLoadingState extends CommentsState{

}

class ErrorGetCommentsState extends CommentsState{
  final String errorMessage;

  ErrorGetCommentsState(this.errorMessage);
}

class SuccessGetCommentsState extends CommentsState{

  final List<CommentModel> commentsList;

  SuccessGetCommentsState(this.commentsList);
}


