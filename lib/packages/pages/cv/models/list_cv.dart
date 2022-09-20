import 'package:shagher/packages/pages/cv/models/cv.dart';
import 'package:shagher/util/api_key.dart';

class ModelListModelCv {
  List<ModelCv>? cv;

  ModelListModelCv({this.cv});

  ModelListModelCv.fromJson(Map<String, dynamic> json) {
    if (json[KeyApi.cv] != null) {
      cv = [];
      json[KeyApi.cv].forEach((v) {
        cv?.add(ModelCv.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cv != null) {
      data[KeyApi.cv] = cv?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
