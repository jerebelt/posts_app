import 'package:dio/dio.dart';
import 'package:posts_app/core/core.dart';
import 'package:posts_app/features/posts/domain/repositories/abstract_posts_repository.dart';

import 'data/data_sources/posts_impl_api.dart';
import 'data/repositories/posts_impl_repository.dart';
import 'domain/usecases/posts_usecase.dart';

initPostsInjections() {
  sl.registerSingleton<PostsImplApi>(PostsImplApi(Dio()));
  sl.registerSingleton<AbstractPostsRepository>(PostsImplRepository(sl()));
  sl.registerSingleton<PostsUseCase>(PostsUseCase(sl()));
}
