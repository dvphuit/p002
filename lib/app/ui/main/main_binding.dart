import 'package:get/get.dart';
import 'package:ku_app/app/ui/main/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
