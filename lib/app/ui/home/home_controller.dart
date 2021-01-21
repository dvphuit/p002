import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/data/models/menu_model.dart';
import 'package:ku_app/app/data/repositories/menu_repo.dart';
import 'package:ku_app/app/routes/app_routes.dart';

enum HomeRoute { LOGIN, REGISTER, SUPPORT, ABOUT, PROMO, CONTACT }

extension on HomeRoute {
  String get text {
    switch (this) {
      case HomeRoute.LOGIN:
        return AppText.Login;
      case HomeRoute.REGISTER:
        return AppText.Register;
      case HomeRoute.SUPPORT:
        return AppText.Support;
      case HomeRoute.ABOUT:
        return AppText.About;
      case HomeRoute.PROMO:
        return AppText.Promo;
      case HomeRoute.CONTACT:
        return AppText.Contact;
    }
  }
}

class Menu {
  final IconData icon;
  final String title;
  final HomeRoute route;

  Menu({this.icon, this.title, this.route});
}

class HomeController extends GetxController {
  final headers = [
    Menu(title: AppText.Login, route: HomeRoute.LOGIN),
    Menu(title: AppText.Register, route: HomeRoute.REGISTER),
  ];

  // final mainMenus = [
  //   Menu(title: AppText.Support, route: HomeRoute.SUPPORT, icon: Icons.support_agent),
  //   Menu(title: AppText.Promo, route: HomeRoute.PROMO, icon: Icons.explore),
  //   Menu(title: AppText.About, route: HomeRoute.ABOUT, icon: Icons.info_outline),
  //   Menu(title: AppText.Contact, route: HomeRoute.CONTACT, icon: Icons.contact_mail_outlined),
  // ];

  void takeAction(HomeRoute action) {
    switch (action) {
      case HomeRoute.LOGIN:
        gotoLogin();
        break;
      case HomeRoute.REGISTER:
        gotoRegister();
        break;
      case HomeRoute.SUPPORT:
        gotoSupport();
        break;
      case HomeRoute.ABOUT:
        gotoAbout();
        break;
      case HomeRoute.PROMO:
        gotoPromo();
        break;
      case HomeRoute.CONTACT:
        gotoContact();
        break;
    }
  }

  void gotoLogin() {
    print('gotoLogin');
    // Get.toNamed(Get.currentRoute + Routes.LOGIN);
    toWeb(AppText.Login, "google.com");
  }

  void gotoRegister() {
    print('gotoRegister');
    // Get.toNamed(Get.currentRoute + Routes.REGISTER);
    toWeb(AppText.Register, "google.com");
  }

  void gotoSupport() {
    print('gotoSupport');
    // Get.toNamed(Get.currentRoute + Routes.SUPPORT);
    toWeb(AppText.Support, "google.com");
  }

  void gotoPromo() {
    print('gotoPromo');
    // Get.toNamed(Get.currentRoute + Routes.PROMO);
    toWeb(AppText.Promo, "google.com");
  }

  void gotoAbout() {
    print('gotoAbout');
    // Get.toNamed(Get.currentRoute + Routes.ABOUT);
    toWeb(AppText.About, "google.com");
  }

  void gotoContact() {
    print('gotoContact ${Get.currentRoute}');
    // Get.toNamed(Get.currentRoute + Routes.CONTACT);
    toWeb(AppText.Contact, "google.com");
  }

  void toWeb(String title, String url) {
    Get.toNamed(Routes.WEB, arguments: {'title': title, 'url': url});
  }

  void toPosts(String title, String tieuDeKD) {
    Get.toNamed(Routes.LIST_POST, arguments: {'title': title, 'tieuDeKD': tieuDeKD});
  }
}
