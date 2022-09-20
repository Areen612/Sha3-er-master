import 'package:shagher/packages/pages/user/models/model_user.dart';
import 'package:shagher/util/api_key.dart';

class ModelListUser {
  List<ModelUser>? user;

  ModelListUser({this.user});

  ModelListUser.fromJson({required Map<String, dynamic> json}) {
    if (json[KeyApi.user] != null) {
      user = <ModelUser>[];
      json[KeyApi.user].forEach(
        (v) {
          user?.add(ModelUser.fromJson(v));
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data[KeyApi.user] = user?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
