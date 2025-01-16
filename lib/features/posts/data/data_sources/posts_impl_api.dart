import 'package:dio/dio.dart';
import 'package:posts_app/core/network/errors/errors.dart';
import 'package:posts_app/features/posts/domain/models/post_model.dart';

import 'abstract_post_api.dart';

class PostsImplApi extends AbstractPostApi {
  final Dio dio;

  PostsImplApi(this.dio);

  // Post Method
  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final result =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      if (result.data == null) {
        throw ServerException("Unkwon error", result.statusCode);
      }
      if (result.data is List) {
        return List<PostModel>.from(result.data
            .map((element) => PostModel.fromJson(element)));
      }
      throw Exception("Unkown Error");
    } on DioException catch (e) {
      throw ServerException(handleDioError(e), e.response?.statusCode);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
