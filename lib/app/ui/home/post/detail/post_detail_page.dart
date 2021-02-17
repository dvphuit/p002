import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/data/models/post_model.dart';
import 'package:ku_app/app/ui/home/post/detail/post_detail_controller.dart';
import 'package:web_view_plugin/web_view_plugin.dart';

class PostDetailPage extends GetView<PostDetailController> {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final type = args['type'];
    PostModel item = args['item'];
    return Scaffold(
      appBar: AppBar(
        title: Text(item.tieuDe),
      ),
      body: WebViewPlugin(
        url: type == 'post' ? Api.getDetail(item.tieuDeKd) : Api.getNewsDetail(item.alias),
      ),
    );
  }
}
