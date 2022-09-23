import 'dart:collection';
import 'package:shagher/packages/pages/Posts/models/post.dart';

class ControllerPosts {
  static final List<ModelPost> _dataPosts = [
    ModelPost(
        id: '0',
        title: 'Company',
        requirements: 'req',
        // rangeSalary: '500-600',
        type: 'paid')
  ];
  // * get List
  static UnmodifiableListView<ModelPost> get _dataList =>
      UnmodifiableListView(_dataPosts);
  // * get List lenght<
  static int get dataLength => _dataList.length;
  // * add a new post to the list
  static void addPost(ModelPost post) => _dataPosts.add(post);
  //* get posts
  static ModelPost getPosts(int index) => _dataList.elementAt(index);
}
