import 'package:get/get.dart';
import 'package:ku_app/app/data/models/post_model.dart';
import 'package:ku_app/app/data/repositories/posts_repo.dart';

class ListPostController extends GetxController {
  final _repo = PostsRepo();
  String title = '';
  List<PostModel> posts;

  @override
  void onReady() async {
    final args = Get.arguments;
    title = args['title'];
    posts = await _repo.getPosts(args['tieuDeKD']);
    update();
    super.onReady();
  }
}
