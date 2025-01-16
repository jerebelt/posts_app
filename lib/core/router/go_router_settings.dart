import 'package:go_router/go_router.dart';
import 'package:posts_app/core/router/app_route_enum.dart';
import 'package:posts_app/features/comments/presentation/presentation.dart';
import 'package:posts_app/features/posts/presentation/presentation.dart';

final goRouterSettings = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        name: AppRouteEnum.postsPage
            .name, 
        path: '/',
        builder: (context, state) => PostsPage(),
        routes: [
          GoRoute(
            name: AppRouteEnum.commentsPage.name,
            path: '/coments/:id_post',
            builder: (context, state) => CommentsPage(
                idPost: RouteParams.fromPathParameters(state.pathParameters)
                    .idPost),
          ),
        ]),
  ],
);

class RouteParams {
  final int idPost;

  RouteParams({
    required this.idPost,
  });

  RouteParams copyWith({
    int? idPost,
  }) =>
      RouteParams(
        idPost: idPost ?? this.idPost,
      );

  factory RouteParams.fromPathParameters(Map<String, dynamic> json) =>
      RouteParams(
        idPost: int.parse(json["id_post"]),
      );

  Map<String, String> toPathParameters() => {
        "id_post": idPost.toString(),
      };
}
