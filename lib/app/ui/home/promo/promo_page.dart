import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'promo_controller.dart';

final script = '''
  var x3 = document.getElementsByClassName('btn_AD');
  x3[0].parentNode.removeChild(x3[0]);
  document.getElementById('AgentID').setAttribute('readonly', 'true');
  
''';

final script2 = '''
  // window.alert = function (str){
  //             Alert.postMessage(str);
  //           }
    function test(){
      alert('Test alert Message');
      return 'show alert';
    }
    test();
''';

class PromoPage extends GetView<PromoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _web(),
      ),
    );
  }

  _web() {
    WebViewController wvController;
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://ff3357.ku11.net/',
      onWebViewCreated: (WebViewController webViewController) {
        wvController = webViewController;
      },
      onPageStarted: (url) {},
      onPageFinished: (url) async {
        wvController?.evaluateJavascript(script)?.then((value) => print('done'));
        await Future.delayed(Duration(seconds: 2));
        wvController?.evaluateJavascript(script2)?.then((value) => print('$value'));
      },
      onWebResourceError: (WebResourceError err) {},
      javascriptChannels: Set.from([
        JavascriptChannel(
          name: 'Alert',
          onMessageReceived: (JavascriptMessage message) {
            print(message.message);
          },
        )
      ]),
    );
  }
}
