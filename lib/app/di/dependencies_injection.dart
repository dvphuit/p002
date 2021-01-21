import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_app/app/data/repositories/menu_repo.dart';
import 'package:ku_app/core/theme/theme_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DependenciesInjection {
  static Future<void> init() async {
    Get.put<ThemeService>(ThemeService());
    await GetStorage.init();
    if (GetPlatform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    Get.put(MenuRepo());
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
