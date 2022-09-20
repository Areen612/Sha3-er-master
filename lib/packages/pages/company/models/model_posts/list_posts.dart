import 'package:shagher/packages/pages/company/models/model_posts/posts.dart';
import 'package:shagher/util/api_key.dart';

class ModelListPosts {
  List<ModelPosts>? posts;

  ModelListPosts({this.posts});

  ModelListPosts.fromJson({required Map<String, dynamic> json})
      : assert(json[KeyApi.posts] != null) {
    posts = [];
    json[KeyApi.posts].forEach(
      (v) {
        posts?.add(ModelPosts.fromJson(json: v));
      },
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posts != null) {
      data[KeyApi.posts] = posts?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
