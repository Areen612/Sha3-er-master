import 'package:shagher/packages/pages/company/models/model_posts/posts.dart';
import 'package:shagher/util/api_key.dart';

class ModelCompany {
  String? companyName;
  String? password;
  String? email;
  String? specialty;
  String? country;
  String? city;
  String? enterpriseOwner;
  String? commercialAddress;
  String? status;
  String? nationalInvestorNumber;
  String? commercialNumber;
  String? commercialName;
  List<ModelPosts>? posts;

  ModelCompany(
      {this.companyName,
      this.password,
      this.email,
      this.specialty,
      this.country,
      this.city,
      this.enterpriseOwner,
      this.commercialAddress,
      this.status,
      this.nationalInvestorNumber,
      this.commercialNumber,
      this.commercialName,
      this.posts});

  ModelCompany.fromJson({required Map<String, dynamic> json})
      : assert(json.isNotEmpty),
        companyName = json[KeyApi.companyName],
        password = json[KeyApi.password],
        email = json[KeyApi.email],
        specialty = json[KeyApi.specialty],
        country = json[KeyApi.country],
        city = json[KeyApi.city],
        enterpriseOwner = json[KeyApi.enterpriseOwner],
        commercialAddress = json[KeyApi.commercialAddress],
        status = json[KeyApi.status],
        nationalInvestorNumber = json[KeyApi.nationalInvestorNumber],
        commercialNumber = json[KeyApi.commercialNumber],
        commercialName = json[KeyApi.commercialName],
        posts = json[KeyApi.posts] != null
            ? json[KeyApi.posts].map((v) {
                return ModelPosts.fromJson(json: {});
              })
            : [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyApi.companyName] = companyName;
    data[KeyApi.password] = password;
    data[KeyApi.email] = email;
    data[KeyApi.specialty] = specialty;
    data[KeyApi.country] = country;
    data[KeyApi.city] = city;
    data[KeyApi.enterpriseOwner] = enterpriseOwner;
    data[KeyApi.commercialAddress] = commercialAddress;
    data[KeyApi.status] = status;
    data[KeyApi.nationalInvestorNumber] = nationalInvestorNumber;
    data[KeyApi.commercialNumber] = commercialNumber;
    data[KeyApi.commercialName] = commercialName;
    if (posts != null) {
      data[KeyApi.posts] = posts?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
