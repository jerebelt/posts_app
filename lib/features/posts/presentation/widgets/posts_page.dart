import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/injections.dart';
import 'package:posts_app/features/posts/domain/models/post_model.dart';
import 'package:posts_app/features/posts/domain/usecases/posts_usecase.dart';
import 'package:posts_app/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:posts_app/shared/widgets/widgets.dart';

import 'post_card_widget.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostsBloc _bloc = PostsBloc(sl<PostsUseCase>());
  List<PostModel> postsList = [];

  @override
  void initState() {
    callPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Post Page'),),
        body: Center(
          child: BlocConsumer<PostsBloc, PostsState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is SuccessGetPostsState) {
                postsList.clear();
                postsList = state.postsList;
              }
            },
            builder: (context, state) {
              if (state is PostsLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is ErrorGetPostsState) {
                return ReloadWidget.error(
                  content: state.errorMessage,
                  onPressed: () {
                    callPosts();
                  },
                );
              }
                
              if (postsList.isEmpty) {
                return ReloadWidget.empty(content: 'No data');
              }
          
          
              return ListView.separated(
                separatorBuilder:(context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Divider(),
                ) ,
                itemCount: postsList.length,
                itemBuilder: (context, index) {
                  return PostCardWidget(
                    post: postsList[index],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  callPosts({bool withLoading = true}) {
    _bloc.add(
      OnGettingPostsEvent(
        withLoading: withLoading,
      ),
    );
  }
}