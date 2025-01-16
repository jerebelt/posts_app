import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/errors/errors.dart';
import 'package:posts_app/features/comments/domain/models/models.dart';

abstract class AbstractCommentsRepository {
  Future<Either<Failure, List<CommentModel>>> getComments(int postId);
}
