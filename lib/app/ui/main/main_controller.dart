import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/data/models/menu_model.dart';
import 'package:ku_app/app/data/repositories/menu_repo.dart';
import 'package:ku_app/app/routes/app_routes.dart';

import 'nav_page.dart';

/// screen model
class ScreenModel {
  final String name;
  final String route;
  final int navKey;

  ScreenModel({this.name, this.route, this.navKey});
}

/// screens models list
final screensData = <ScreenModel>[
  ScreenModel(name: ku_mode ? 'TOOL' : 'Trang chủ', route: Routes.HOME, navKey: 1),
  ScreenModel(name: ku_mode ? 'HOME' : 'Tin tức', route: Routes.PROMO, navKey: 2),
  ScreenModel(name: ku_mode ? 'HỖ TRỢ' : 'Hỗ trợ', route: Routes.SUPPORT, navKey: 3),
];

class MainController extends GetxController {
  var title = screensData[0].name.obs;

//#############################################

  final navMenuIndex = 0.obs;

  ScreenModel get currentScreenModel => screensData[navMenuIndex()];

  // store the pages stack.
  List<Widget> _pages;

  // get navigators.
  List<Widget> get menuPages => _pages ??= screensData.map((e) => _TabNav(e)).toList();
}

/// sub navigators.
class _TabNav extends GetView<MainController> {
  final ScreenModel model;

  _TabNav(this.model);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(model.navKey),
      onGenerateRoute: (settings) => getNavRoutes(model.route),
    );
  }
}
