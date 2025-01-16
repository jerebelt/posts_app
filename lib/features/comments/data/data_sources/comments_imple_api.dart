import 'package:dio/dio.dart';
import 'package:posts_app/core/network/errors/errors.dart';
import 'package:posts_app/features/comments/data/data_sources/abstract_coment_api.dart';
import 'package:posts_app/features/comments/domain/models/comment_model.dart';

class CommentsImpleApi extends AbstractCommentApi {
  final Dio dio;

  CommentsImpleApi(this.dio);

  @override
  Future<List<CommentModel>> getComents(int postId) async {
    try {
      final result = await dio.get(
          'https://jsonplaceholder.typicode.com/comments',
          queryParameters: {'postId': postId});
      if (result.data == null) {
        throw ServerException("Unkwon error", result.statusCode);
      }
      if (result.data is List) {
        return List<CommentModel>.from(
            result.data.map((element) => CommentModel.fromJson(element)));
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
