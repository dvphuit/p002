import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';

class NewsRequest extends GetConnect {
  Future<Response> getPosts() => get(Api.baseUrl, query: {'action': 'list_posts_news'});
}
