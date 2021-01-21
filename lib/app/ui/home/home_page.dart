import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/data/models/menu_model.dart';
import 'package:ku_app/app/routes/app_routes.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  final spacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          // headers,
          SliverPadding(
            padding: const EdgeInsets.only(top: 8),
          ),
          GetBuilder<HomeController>(builder: (_) => mainMenus),
        ],
      ).paddingSymmetric(
        horizontal: spacing,
      ),
    );
  }

  _web() {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://ff3357.ku11.net/',
      onWebViewCreated: (WebViewController webViewController) {},
      onPageStarted: (url) {},
      onPageFinished: (url) {},
      onWebResourceError: (WebResourceError err) {},
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
                  colorFilter:
                      new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
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
                _contactDialog();
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

  _contactDialog() {
    Get.defaultDialog(
      title: "Liên hệ",
      content: RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            text: 'Ms Châu\n',
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              new TextSpan(
                text: '0901 193 193\n',
                style: new TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
              new TextSpan(
                text: 'Số 2 Trương Quốc Dung, Phường 8, Phú Nhuận, HCM',
                style: new TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
              ),
            ],
          )),
      textConfirm: "Đóng",
      onConfirm: () => Get.back(),
      confirmTextColor: Colors.white,
      radius: 5,
    );
  }

  Widget get headers => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _item(controller.headers[index]);
          },
          childCount: controller.headers.length,
        ),
      );

  Widget get mainMenus => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _mainItem(controller.mainMenus[index]),
          childCount: controller.mainMenus.length,
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
