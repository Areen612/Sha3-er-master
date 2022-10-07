import 'package:shagher/packages/pages/cv/models/cv.dart';

import '../../../../util/api_key.dart';

class ModelUser {
  String? uid;
  String? firstName;
  String? lastName;
  String? imageUrl;
  String? email;
  ModelCv? cv;

  ModelUser({
    this.uid,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.email,
    this.cv,
  });
  ModelUser.fromMap(Map<dynamic, dynamic> data) {
    uid = data[KeyApi.id];
    firstName = data[KeyApi.firstName];
    lastName = data[KeyApi.lastName];
    email = data[KeyApi.email];
    imageUrl = data[KeyApi.imageUrl];
    cv = data[KeyApi.cv];
  }

  Map<dynamic, dynamic> toMap() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data[KeyApi.firstName] = firstName;
    data[KeyApi.lastName] = lastName;
    data[KeyApi.email] = email;
    data[KeyApi.imageUrl] = imageUrl;
    data[KeyApi.cv] = cv;
    return data;
  }
}
