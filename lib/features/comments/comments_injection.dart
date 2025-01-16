import 'package:dio/dio.dart';
import 'package:posts_app/core/core.dart';
import 'package:posts_app/features/comments/data/data_sources/abstract_coment_api.dart';
import 'package:posts_app/features/comments/data/data_sources/comments_imple_api.dart';
import 'package:posts_app/features/comments/domain/usecases/comments_usecase.dart';

import 'data/repositories/comments_impl_repository.dart';
import 'domain/repositories/abstract_comments_repository.dart';

initCommentsInjections() {
  sl.registerSingleton<AbstractCommentApi>(CommentsImpleApi(Dio()));
  sl.registerSingleton<AbstractCommentsRepository>(CommentsImplRepository(sl()));
  sl.registerSingleton<CommentsUseCase>(CommentsUseCase(sl()));
}
