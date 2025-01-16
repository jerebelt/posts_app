import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/core.dart';
import 'package:posts_app/features/posts/domain/models/models.dart';
import 'package:posts_app/features/posts/domain/usecases/posts_usecase.dart';

part "posts_event.dart";

part "posts_state.dart";

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsUseCase postsUseCase;

  PostsBloc(this.postsUseCase) : super(PostsInitialState()) {
    on<OnGettingPostsEvent>(_onGettingPostsEvent);
  }

  _onGettingPostsEvent(
    OnGettingPostsEvent event, Emitter<PostsState> emitter
  ) async {
    if(event.withLoading){
        emitter(PostsLoadingState());
    }

    final result = await postsUseCase.call(NoParams());
     result.fold((l) {
       emitter(ErrorGetPostsState(l.errorMessage));
    }, (r) {
       emitter(SuccessGetPostsState(r));
    });
  } 
}
