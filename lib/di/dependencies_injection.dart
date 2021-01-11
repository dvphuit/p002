import 'package:get/get.dart';

import '../core/theme/theme_service.dart';
import '../core/theme/theme_service.dart';

class DependenciesInjection {
  static Future<void> init() async {
    Get.put<ThemeService>(ThemeService());
    // Get.put<Dio>(Dio(BaseOptions(
    //   baseUrl: baseUrl,
    //   followRedirects: false,
    //   connectTimeout: 10000,
    // )));
    //
    // // repositories
    // Get.put<AuthRepo>(AuthRepo());
    // Get.put<UserRepo>(UserRepo());
    // Get.put<PostsRepo>(PostsRepo());
  }
}
