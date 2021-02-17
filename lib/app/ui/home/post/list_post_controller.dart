import 'package:get/get.dart';
import 'package:ku_app/app/data/models/post_model.dart';
import 'package:ku_app/app/data/repositories/posts_repo.dart';
import 'package:ku_app/app/routes/app_routes.dart';

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

  void gotoDetail(PostModel item) {
    Get.toNamed(Routes.POST_DETAIL, arguments: {'type': 'post', 'item': item});
  }
}
