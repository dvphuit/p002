import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/routes/app_routes.dart';
import 'package:web_view_plugin/web_view_plugin.dart';

import 'support_controller.dart';

class SupportPage extends GetView<SupportController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ku_mode ? _web() : _normal(),
      ),
    );
  }

  _web() {
    return WebViewPlugin(
      url: 'https://www.kuvip.me/cskh/',
    );
  }

  _normal() {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('Giới thiệu'),
          onTap: () {
            Get.toNamed(Routes.TERM_OF_USE, arguments: {'view': true, 'type': 'about'});
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_mail_rounded),
          title: Text('Liên hệ'),
          onTap: () {
            _contactDialog();
          },
        ),
        ListTile(
          leading: Icon(Icons.policy_rounded),
          title: Text('Chính sách sử dụng'),
          onTap: () {
            Get.toNamed(Routes.TERM_OF_USE, arguments: {'view': true, 'type': 'policy'});
          },
        ),
      ],
    );
  }

  _contactDialog() {
    Get.defaultDialog(
      title: "Liên hệ",
      content: RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            text: 'Mr.Viet\n',
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              new TextSpan(
                text: '0901 111 222\n',
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
}
