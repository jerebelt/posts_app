import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/errors/failures.dart';
import 'package:posts_app/core/utils/utils.dart';
import 'package:posts_app/features/posts/domain/models/models.dart';
import 'package:posts_app/features/posts/domain/repositories/abstract_posts_repository.dart';

class PostsUseCase extends UseCase<List<PostModel>, NoParams> {
  final AbstractPostsRepository postsRepository;

  PostsUseCase(this.postsRepository);

  @override
  Future<Either<Failure, List<PostModel>>> call(NoParams params) async {
    final result = await postsRepository.getPosts();
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
