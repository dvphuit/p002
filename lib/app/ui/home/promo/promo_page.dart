import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/data/models/post_model.dart';
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
        body: ku_mode ? _web() : _normal(),
      ),
    );
  }

  _normal() {
    return GetBuilder<PromoController>(
        builder: (_) => Scaffold(
              body: controller.posts == null
                  ? Center(child: CircularProgressIndicator())
                  : controller.posts.isEmpty
                      ? emptyView
                      : listViewPost,
            ));
  }

  Widget get emptyView => Center(
        child: Text(
          'Chưa có bài viết nào cho mục này.',
          style: TextStyle(fontSize: 18),
        ),
      );

  Widget get listViewPost => ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: controller.posts.length,
      itemBuilder: (ctx, index) {
        return item(controller.posts[index]);
      });

  Widget item(PostModel post) {
    return Container(
      height: 220,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
        color: Colors.black26,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
          image: CachedNetworkImageProvider(post.urlHinh),
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () => controller.gotoDetail(post),
          splashColor: Colors.white12,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              '${post.tieuDe}',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white, shadows: [
                Shadow(
                  offset: Offset.zero,
                  color: Colors.black,
                  blurRadius: 2,
                ),
                Shadow(
                  offset: Offset.zero,
                  color: Colors.black,
                  blurRadius: 4,
                )
              ]),
            ),
          ).paddingAll(8),
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
