import 'package:ku_app/app/data/models/post_model.dart';
import 'package:ku_app/app/data/providers/posts_request.dart';
import 'package:ku_app/core/data/repositories/base_repo.dart';

class PostsRepo extends BaseRepo {
  final api = PostsRequest();

  Future<List<PostModel>> getPosts(String tieuDeKD) async {
    var json = await api.getPosts(tieuDeKD);
    var res = PostResponse.fromJson(json.body);
    if (res.resultCode != 200) {
      return List<PostModel>();
    }
    return res.data;
  }
}
