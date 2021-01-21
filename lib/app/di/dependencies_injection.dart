import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_app/app/data/repositories/menu_repo.dart';
import 'package:ku_app/core/theme/theme_service.dart';

class DependenciesInjection {
  static Future<void> init() async {
    Get.put<ThemeService>(ThemeService());
    await GetStorage.init();
    Get.put(MenuRepo());
  }
}
