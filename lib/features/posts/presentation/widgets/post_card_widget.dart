import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_app/core/router/app_route_enum.dart';
import 'package:posts_app/core/router/router.dart';
import 'package:posts_app/features/posts/domain/models/models.dart';

class PostCardWidget extends StatefulWidget {
  final PostModel post;

  const PostCardWidget({super.key, required this.post});

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
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
                // Title
                Text(
                  widget.post.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),

                SizedBox(height: 8),

                Text(
                  widget.post.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey),
                ),

                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {
              context.goNamed(AppRouteEnum.commentsPage.name,
                  pathParameters: RouteParams(idPost: widget.post.id).toPathParameters() );
            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
