import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/data/models/post_model.dart';
import 'package:ku_app/app/ui/home/post/detail/post_detail_controller.dart';
import 'package:web_view_plugin/web_view_plugin.dart';

class PostDetailPage extends GetView<PostDetailController> {
  @override
  Widget build(BuildContext context) {
    PostModel args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.tieuDe),
      ),
      body: WebViewPlugin(
        url: Api.getDetail(args.tieuDeKd),
      ),
    );
  }
}
