import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network/errors/errors.dart';
import 'package:posts_app/features/posts/domain/models/models.dart';

abstract class AbstractPostsRepository {
  
  Future<Either<Failure, List<PostModel>>> getPosts();
}