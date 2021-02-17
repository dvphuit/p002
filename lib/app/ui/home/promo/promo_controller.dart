import 'package:get/get.dart';
import 'package:ku_app/app/data/models/post_model.dart';
import 'package:ku_app/app/data/repositories/news_repo.dart';
import 'package:ku_app/app/routes/app_routes.dart';

class PromoController extends GetxController {
  List<PostModel> posts = [];

  @override
  void onReady() async {
    var api = NewsRepo();
    super.onReady();
    posts = await api.getPosts();
    update();
  }

  void gotoDetail(PostModel item) {
    Get.toNamed(Routes.POST_DETAIL, arguments: {'type': 'news', 'item': item});
  }
}
