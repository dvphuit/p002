import 'package:get/get.dart';
import 'package:ku_app/app/ui/home/post/list_post_controller.dart';

class ListPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListPostController());
  }
}
