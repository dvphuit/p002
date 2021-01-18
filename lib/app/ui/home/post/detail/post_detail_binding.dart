import 'package:get/get.dart';
import 'package:ku_app/app/ui/home/post/detail/post_detail_controller.dart';

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostDetailController());
  }
}
