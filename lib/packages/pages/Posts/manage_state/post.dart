import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';

class ManageStatePost extends ChangeNotifier {
  final List<ModelPost> _posts = [];

  // * get List
  UnmodifiableListView<ModelPost> get posts => UnmodifiableListView(_posts);

  // * add a new post to the list
  void addPost(ModelPost post) {
    _posts.add(post);
  }

  // * get post
  ModelPost? getPost(int id) {
    for (var post in _posts) {
      if (post.id == id) {
        return post;
      }
    }
    return null;
  }
  // * update post
  // * delete post

}
