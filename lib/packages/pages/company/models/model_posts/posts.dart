import 'package:shagher/packages/pages/company/models/model_company/company.dart';

class ModelPosts {
  String? title;
  String? requirements;
  String? rangeSalary;
  String? type;
  ModelCompany? creator;

  ModelPosts(
      {this.title,
      this.requirements,
      this.rangeSalary,
      this.type,
      this.creator});

  ModelPosts.fromJson({required Map<String, dynamic> json}) {
    title = json['title'];
    requirements = json['requirements'];
    rangeSalary = json['rangeSalary'];
    type = json['type'];
    creator = json['creator'];
    // creator = json['creator'] != null
    //     ? ModelCompany.fromJson(json: json['creator'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['requirements'] = requirements;
    data['rangeSalary'] = rangeSalary;
    data['type'] = type;
    data['creator'] = creator; //TODO: ref
    return data;
  }
}

// class Creator {


// 	Creator({});

// 	Creator.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }
