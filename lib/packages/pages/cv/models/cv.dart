import 'package:cloud_firestore/cloud_firestore.dart';
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

  ModelCv.fromQueryDocumentSnapshot(QueryDocumentSnapshot data) {
    firstName = data[KeyApi.firstName];
    lastName = data[KeyApi.lastName];
    birthDate = data[KeyApi.birthDate];
    experience = data[KeyApi.experience];
    skills = data[KeyApi.skills];
    mobileNumber = data[KeyApi.mobileNumber];
    email = data[KeyApi.email];
    country = data[KeyApi.country];
    city = data[KeyApi.city];
    creator = data[KeyApi.creator];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyApi.firstName] = firstName;
    data[KeyApi.lastName] = lastName;
    data[KeyApi.birthDate] = birthDate;
    data[KeyApi.experience] = experience;
    data[KeyApi.skills] = skills;
    data[KeyApi.mobileNumber] = mobileNumber;
    data[KeyApi.email] = email;
    data[KeyApi.country] = country;
    data[KeyApi.city] = city;
    data[KeyApi.creator] = creator;
    return data;
  }
}
