
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/comments/domain/models/models.dart';
import 'package:posts_app/features/comments/domain/usecases/comments_usecase.dart';

part "comments_event.dart";

part "comments_state.dart";

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final CommentsUseCase comentsUseCase;

  CommentsBloc(this.comentsUseCase) : super(CommentsInitialState()) {
    on<OnGettingCommentsEvent>(_onGettingCommentsEvent);
  }

  _onGettingCommentsEvent(
    OnGettingCommentsEvent event, Emitter<CommentsState> emitter
  ) async {
    if(event.withLoading){
        emitter(CommentsLoadingState());
    }

    final result = await comentsUseCase.call(CommentParams(id: event.postId));
     result.fold((l) {
       emitter(ErrorGetCommentsState(l.errorMessage));
    }, (r) {
       emitter(SuccessGetCommentsState(r));
    });
  } 
}
