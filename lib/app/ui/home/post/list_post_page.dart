import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/data/models/post_model.dart';
import 'package:ku_app/app/ui/home/post/list_post_controller.dart';

class ListPostPage extends GetView<ListPostController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListPostController>(
        builder: (_) => SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(controller.title),
                ),
                body: controller.posts == null
                    ? Center(child: CircularProgressIndicator())
                    : controller.posts.isEmpty
                        ? emptyView
                        : listViewPost,
              ),
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
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          '${post.tieuDe}',
          style:
              TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white, shadows: [
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
    );
  }
}
