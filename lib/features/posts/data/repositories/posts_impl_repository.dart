import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/errors/errors.dart';
import 'package:posts_app/features/posts/data/data_sources/posts_impl_api.dart';
import 'package:posts_app/features/posts/domain/models/post_model.dart';
import 'package:posts_app/features/posts/domain/repositories/abstract_posts_repository.dart';

class PostsImplRepository extends AbstractPostsRepository {
  final PostsImplApi postApi;

  PostsImplRepository(this.postApi);

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      final result = await postApi.getPosts();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
