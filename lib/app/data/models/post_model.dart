import 'package:ku_app/core/data/models/base_model.dart';

class PostModel extends BaseModel {
  final String title;
  final String coverUrl;
  final String description;
  final String url;

  PostModel({this.title, this.coverUrl, this.description, this.url});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        title: json['title'],
        coverUrl: json['cover_url'],
        description: json['description'],
        url: json['url'],
      );
}
