import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/data/models/menu_model.dart';
import 'package:ku_app/app/routes/app_routes.dart';
import 'package:web_view_plugin/web_view_plugin.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  final spacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: drawer,
      body: ku_mode
          ? _web()
          : CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                // headers,
                SliverPadding(
                  padding: const EdgeInsets.only(top: 8),
                ),
                GetBuilder<HomeController>(builder: (_) => menus),
              ],
            ).paddingSymmetric(
              horizontal: spacing,
            ),
    );
  }

  _web() {
    return WebViewPlugin(
      url: 'https://lotobettool.com/',
    );
  }

  Widget get drawer => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                  image: CachedNetworkImageProvider(
                      'https://informa-mea-res.cloudinary.com/image/upload/training/course-images/certificate-in-real-estate-process-for-development-investment-repdi-course.jpg'),
                ),
              ),
              child: Text(""),
            ),
            ListTile(
              title: Text("Giới thiệu"),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              title: Text("Liên hệ"),
              onTap: () {
                // _contactDialog();
              },
            ),
            ListTile(
              title: Text("Điều khoản sử dụng"),
              onTap: () {
                Get.toNamed(Routes.TERM_OF_USE, arguments: 'view');
              },
            ),
          ],
        ),
      );

  Widget get headers => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3, mainAxisSpacing: spacing, crossAxisSpacing: spacing),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _item(controller.headers[index]);
          },
          childCount: controller.headers.length,
        ),
      );

  Widget get menus => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _mainItem(mainMenus[index]),
          childCount: mainMenus.length,
        ),
      );

  Widget _item(Menu menu) => Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset.zero, blurRadius: 5.0)],
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: () {},
            splashColor: Colors.white12,
            child: Center(child: Text(menu.title)),
          ),
        ),
      );

  Widget _mainItem(MenuModel menu) => Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: CachedNetworkImageProvider(menu.urlHinh),
          ),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: () => controller.toPosts(menu.tieuDe, menu.tieuDeKd),
            splashColor: Colors.white12,
            child: Center(
              child: Text(
                menu.tieuDe,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 2.0,
                      color: Colors.black87,
                    ),
                    Shadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 5.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
