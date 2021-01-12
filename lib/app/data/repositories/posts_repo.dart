import 'package:ku_app/app/data/models/post_model.dart';
import 'package:ku_app/app/data/providers/posts_request.dart';
import 'package:ku_app/core/data/repositories/base_repo.dart';

class PostsRepo extends BaseRepo {
  void getPosts() => send<PostModel>(PostsRequest());
}
