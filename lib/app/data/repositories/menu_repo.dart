import 'package:ku_app/app/data/models/menu_model.dart';
import 'package:ku_app/app/data/providers/menu_request.dart';

class MenuRepo {
  final api = MenuRequest();

  Future<List<MenuModel>> getMenu() async {
    var json = await api.getMenu();
    var res = MenuResponse.fromJson(json.body);
    if (res.resultCode != 200) {
      return List<MenuModel>();
    }
    return res.data;
  }
}
