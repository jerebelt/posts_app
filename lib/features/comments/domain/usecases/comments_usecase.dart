import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/errors/failures.dart';
import 'package:posts_app/core/utils/utils.dart';
import 'package:posts_app/features/comments/domain/models/models.dart';
import 'package:posts_app/features/comments/domain/repositories/abstract_comments_repository.dart';

class CommentsUseCase extends UseCase<List<CommentModel>, CommentParams> {
  final AbstractCommentsRepository postsRepository;

  CommentsUseCase(this.postsRepository);

  @override
  Future<Either<Failure, List<CommentModel>>> call(CommentParams params) async {
    final result = await postsRepository.getComments(params.id);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
