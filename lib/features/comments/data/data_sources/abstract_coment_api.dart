
import 'package:posts_app/features/comments/domain/models/models.dart';

abstract class AbstractCommentApi {
  Future<List<CommentModel>> getComents(int postId);
}