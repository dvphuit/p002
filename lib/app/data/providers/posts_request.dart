import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';

class PostsRequest extends GetConnect {
  Future<Response> getPosts(String tieuDeKD) =>
      get(Api.baseUrl, query: {'action': 'list_posts_real_estate', 'TieuDeKD': tieuDeKD});
}
