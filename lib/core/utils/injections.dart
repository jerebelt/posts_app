import 'package:get_it/get_it.dart';
import 'package:posts_app/features/comments/comments_injection.dart';
import 'package:posts_app/features/posts/posts_injections.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initPostsInjections();
  await initCommentsInjections();
}
