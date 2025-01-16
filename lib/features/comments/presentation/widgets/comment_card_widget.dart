import 'package:flutter/material.dart';
import 'package:posts_app/features/comments/domain/models/models.dart';

class CommentCardWidget extends StatefulWidget {
  final CommentModel comment;

  const CommentCardWidget({super.key, required this.comment});

  @override
  State<CommentCardWidget> createState() => _CommentCardWidgetState();
}

class _CommentCardWidgetState extends State<CommentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.comment.email,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.blueGrey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                Text(
                  widget.comment.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.blueGrey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                SizedBox(height: 8),
                Text(
                  widget.comment.body,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
