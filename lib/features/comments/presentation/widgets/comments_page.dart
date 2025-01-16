import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/core.dart';
import 'package:posts_app/features/comments/domain/models/models.dart';
import 'package:posts_app/features/comments/domain/usecases/comments_usecase.dart';
import 'package:posts_app/features/comments/presentation/bloc/comments_bloc.dart';
import 'package:posts_app/features/comments/presentation/presentation.dart';
import 'package:posts_app/shared/presentation/widgets/widgets.dart';

class CommentsPage extends StatefulWidget {
  final int idPost;
  const CommentsPage({super.key, required this.idPost});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final CommentsBloc _bloc = CommentsBloc(sl<CommentsUseCase>());
  List<CommentModel> commentsList = [];

  @override
  void initState() {
    callComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Comment on post'),
        ),
        body: Center(
          child: BlocConsumer<CommentsBloc, CommentsState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is SuccessGetCommentsState) {
                commentsList.clear();
                commentsList = state.commentsList;
              }
            },
            builder: (context, state) {
              if (state is CommentsLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is ErrorGetCommentsState) {
                return ReloadWidget.error(
                  content: state.errorMessage,
                  onPressed: () {
                    callComments();
                  },
                );
              }

              if (commentsList.isEmpty) {
                return ReloadWidget.empty(content: 'No data');
              }

              return ListView.separated(
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
                itemCount: commentsList.length,
                itemBuilder: (context, index) {
                  return CommentCardWidget(
                    comment: commentsList[index],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  callComments({bool withLoading = true}) {
    _bloc.add(
      OnGettingCommentsEvent(
        widget.idPost,
        withLoading: withLoading,
      ),
    );
  }
}
