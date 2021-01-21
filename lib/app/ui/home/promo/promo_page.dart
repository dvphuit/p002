import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:web_view_plugin/web_view_plugin.dart';

import 'promo_controller.dart';

final script = '''
  var x3 = document.getElementsByClassName('btn_AD');
  x3[0].parentNode.removeChild(x3[0]);
  document.getElementById('AgentID').setAttribute('readonly', 'true');
''';

class PromoPage extends GetView<PromoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ku_mode
            ? _web()
            : Container(
                color: Colors.red,
              ),
      ),
    );
  }

  _web() {
    return WebViewPlugin(
      url: 'https://ff3357.ku11.net/',
      onPageFinished: (WebViewController webController) async {
        webController.evalJs(script: script);
      },
    );
  }
}
