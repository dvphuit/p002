import 'package:get/get.dart';
import 'package:ku_app/app/ui/home/support/support_controller.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportController());
  }
}
