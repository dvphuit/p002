import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(args['title']),
        ),
        body: Center(
          child: Text(args['url']),
        ),
      ),
    );
  }
}
