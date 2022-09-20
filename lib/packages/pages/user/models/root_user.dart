import 'package:shagher/packages/pages/user/models/list_user.dart';
import 'package:shagher/util/api_key.dart';

class ModelRootUser {
  ModelListUser? dataUser;

  ModelRootUser({this.dataUser});

  ModelRootUser.fromJson({required Map<String, dynamic> json}) {
    dataUser = json[KeyApi.user] != null
        ? ModelListUser.fromJson(json: json[KeyApi.user])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataUser != null) {
      data[KeyApi.user] = dataUser?.toJson();
    }
    return data;
  }
}
