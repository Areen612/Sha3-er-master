import 'package:shagher/util/api_key.dart';

class ModelCv {
  String? firstName;
  String? lastName;
  String? birthDate;
  String? experience;
  String? skills;
  String? mobileNumber;
  String? email;
  String? country;
  String? city;
  String? creator;

  ModelCv(
      {this.firstName,
      this.lastName,
      this.birthDate,
      this.experience,
      this.skills,
      this.mobileNumber,
      this.email,
      this.country,
      this.city,
      this.creator});

  ModelCv.fromJson(Map<String, dynamic> json) {
    firstName = json[KeyApi.firstName];
    lastName = json[KeyApi.lastName];
    birthDate = json[KeyApi.birthDate];
    experience = json[KeyApi.experience];
    skills = json[KeyApi.skills];
    mobileNumber = json[KeyApi.phoneNumber];
    email = json[KeyApi.email];
    country = json[KeyApi.country];
    city = json[KeyApi.city];
    creator = json[KeyApi.creator];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyApi.firstName] = firstName;
    data[KeyApi.lastName] = lastName;
    data[KeyApi.birthDate] = birthDate;
    data[KeyApi.experience] = experience;
    data[KeyApi.skills] = skills;
    data[KeyApi.phoneNumber] = mobileNumber;
    data[KeyApi.email] = email;
    data[KeyApi.country] = country;
    data[KeyApi.city] = city;
    data[KeyApi.creator] = creator;
    return data;
  }
}
