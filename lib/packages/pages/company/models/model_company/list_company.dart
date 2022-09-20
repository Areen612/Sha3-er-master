import 'package:shagher/packages/pages/company/models/model_company/company.dart';
import 'package:shagher/util/api_key.dart';

class ModelListCompany {
  List<ModelCompany>? company;

  ModelListCompany({this.company});

  ModelListCompany.fromJson({required Map<String, dynamic> json})
      : assert(json[KeyApi.company] != null) {
    company = [];
    json[KeyApi.company].forEach((v) {
      company?.add(ModelCompany.fromJson(json: v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (company != null) {
      data[KeyApi.company] = company?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
