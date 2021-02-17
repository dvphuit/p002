import 'package:ku_app/app/data/models/post_model.dart';
import 'package:ku_app/app/data/providers/news_request.dart';
import 'package:ku_app/app/data/providers/posts_request.dart';
import 'package:ku_app/core/data/repositories/base_repo.dart';

class NewsRepo extends BaseRepo {
  final api = NewsRequest();

  Future<List<PostModel>> getPosts() async {
    var json = await api.getPosts();
    var res = PostResponse.fromJson(json.body);
    if (res.resultCode != 200) {
      return List<PostModel>();
    }
    return res.data;
  }
}
