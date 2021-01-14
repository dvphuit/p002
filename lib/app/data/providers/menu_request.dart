import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';

class MenuRequest extends GetConnect {
  Future<Response> getMenu() => get(Api.baseUrl, query: {'action': 'category_real_estate'});
}
