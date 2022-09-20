import 'package:shagher/packages/pages/company/models/model_company/company.dart';
import 'package:shagher/util/api_key.dart';

class AutogeneratedCompany {
  ModelCompany? company;

  AutogeneratedCompany({this.company});

  AutogeneratedCompany.fromJson({required Map<String, dynamic> json}) {
    company = json[KeyApi.company] != null
        ? ModelCompany.fromJson(json: json[KeyApi.company])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (company != null) {
      data[KeyApi.company] = company?.toJson();
    }
    return data;
  }
}
