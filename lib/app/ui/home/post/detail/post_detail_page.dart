import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/data/models/post_model.dart';
import 'package:ku_app/app/ui/home/post/detail/post_detail_controller.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PostDetailPage extends GetView<PostDetailController> {
  @override
  Widget build(BuildContext context) {
    PostModel args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.tieuDe),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: Api.getDetail(args.tieuDeKd),
        onWebViewCreated: (WebViewController webViewController) {},
        onPageStarted: (url) {},
        onPageFinished: (url) {},
        onWebResourceError: (WebResourceError err) {},
      ),
    );
  }
}
