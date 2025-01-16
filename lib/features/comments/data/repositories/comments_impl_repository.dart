import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/errors/errors.dart';
import 'package:posts_app/features/comments/data/data_sources/abstract_coment_api.dart';
import 'package:posts_app/features/comments/domain/models/comment_model.dart';
import 'package:posts_app/features/comments/domain/repositories/abstract_comments_repository.dart';

class CommentsImplRepository  extends AbstractCommentsRepository {
  final AbstractCommentApi commentsApi;

  CommentsImplRepository(this.commentsApi);

  @override
  Future<Either<Failure, List<CommentModel>>> getComments(int postId) async {
       try {
      final result = await commentsApi.getComents(postId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
  
}
