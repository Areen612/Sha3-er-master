import 'package:flutter/cupertino.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';
import 'package:uuid/uuid.dart';

import '../firestore/firestore_services.dart';

class PostProvider with ChangeNotifier {
  String? _postId;
  String? _title;
  String? _requirements;
  String? _description;
  String? _rangeSalary;
  //double? _rangeSalaryStart;
  //double? _rangeSalaryEnd;
  String? _type;
  String? _subType;
  String? _creator;
  int? _status;

  String get getTitle => _title!;
  String get getRequirements => _requirements!;
  String get getDescription => _description!;
  String get getRangeSalary => _rangeSalary!;
  String get getType => _type!;
  String get getSubType => _subType!;
  String get getCreator => _creator!;
  int get getStatus => _status!;

  final service = FireStoreService();
  var uuid = const Uuid();
  //  postProvider.saveData(); => edit post => pop
  void saveData() {
    if (_postId == null) {
      var newPost = ModelPost(
        id: uuid.v4(),
        title: getTitle,
        requirements: getRequirements,
        description: getDescription,
        rangeSalary: getRangeSalary,
        type: getType,
        subType: getSubType,
        creator: getCreator,
        status: getStatus,
      );
      service.savePost(newPost);
    } else {
      var updatedPost = ModelPost(
        id: _postId,
        title: getTitle,
        requirements: getRequirements,
        description: getDescription,
        rangeSalary: getRangeSalary,
        type: getType,
        subType: getSubType,
        creator: getCreator,
        status: getStatus,
      );
      service.savePost(updatedPost);
    }
  }

  loadValues(ModelPost post) {
    _postId = post.id;
    _title = post.title;
    _description = post.description;
    _rangeSalary = post.rangeSalary;
    _requirements = post.requirements;
    _type = post.type;
    _subType = post.subType;
    _status = post.status;
  }

  // onChanged: (val) => postProvider.changePostTitle(val), => edit post feild
  void changePostTitle(String val) {
    _title = val;
    notifyListeners();
  }

  void changePostRequirment(String val) {
    _requirements = val;
    notifyListeners();
  }

  void changePostDescription(String val) {
    _description = val;
    notifyListeners();
  }

  void changePostRangeSalary(String val) {
    _rangeSalary = val;
    notifyListeners();
  }

  void changePostType(String val) {
    _type = val;
    notifyListeners();
  }

  void changePostSubType(String val) {
    _subType = val;
    notifyListeners();
  }

  void changePostStatus(int val) {
    _status = val;
    notifyListeners();
  }
}
