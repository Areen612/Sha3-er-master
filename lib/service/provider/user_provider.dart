import 'package:flutter/cupertino.dart';
import 'package:shagher/packages/pages/cv/models/cv.dart';
import 'package:uuid/uuid.dart';
import '../../packages/pages/user/models/user.dart';
import '../firestore/firestore_services.dart';

class UserProvider with ChangeNotifier {
  String? _uid;
  String? _firstName;
  String? _lastName;
  String? _imageUrl;
  String? _email;
  ModelCv? _cv;

  String get getUid => _uid!;
  String get getFirstName => _firstName!;
  String get getLastName => _lastName!;
  String get getEmail => _email!;
  String get getImageUrl => _imageUrl!;
  ModelCv get getCv => _cv!;

  final service = FireStoreService();
  var uuid = const Uuid();
  //  postProvider.saveData(); => edit post => pop
  void saveData() {
    if (_uid == null) {
      var newUser = ModelUser(
          uid: uuid.v4(),
          firstName: _firstName,
          lastName: _lastName,
          imageUrl: _imageUrl,
          cv: _cv);
      service.saveUser(newUser);
    } else {
      var updatedUser = ModelUser(
          uid: _uid,
          firstName: _firstName,
          lastName: _lastName,
          imageUrl: _imageUrl,
          cv: _cv);
      service.saveUser(updatedUser);
    }
  }

  // onChanged: (val) => postProvider.changePostTitle(val), => edit post feild
  // void changePostTitle(String val) {
  //   _title = val;
  //   notifyListeners();
  // }

}
