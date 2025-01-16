
import 'package:posts_app/features/posts/domain/models/models.dart';

abstract class AbstractPostApi {
  
  Future<List<PostModel>> getPosts();
}