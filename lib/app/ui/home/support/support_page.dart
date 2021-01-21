import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'support_controller.dart';

class SupportPage extends GetView<SupportController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _web(),
      ),
    );
  }

  _web() {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://www.kuvip.me/cskh/',
      onWebViewCreated: (WebViewController webViewController) {
        webViewController.evaluateJavascript('');
      },
      onPageStarted: (url) {},
      onPageFinished: (url) {},
      onWebResourceError: (WebResourceError err) {},
    );
  }
}
