import 'package:shagher/util/api_key.dart';

class ModelUserAuth {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  // * cv
  String? specialty;
  DateTime? birthDate;
  String? experience;
  String? skills;
  String? phoneNumber;
  String? country;
  String? city;
  String? imageUrl;
  String? cvUrl;
  // String creator;
// List<ModelCv>? cv;

  ModelUserAuth({
    this.id,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.specialty = '',
    this.birthDate,
    this.experience = '',
    this.skills = '',
    this.phoneNumber = '',
    this.country = '',
    this.city = '',
    this.imageUrl = '',
    this.cvUrl = '',
  });
  setFname(String? firstName) {
    this.firstName = firstName ?? '';
  }

  setLname(String? lastName) => this.lastName = lastName ?? '';
  setEmail(String? email) => this.email = email ?? '';
  setPass(String? password) => this.password = password ?? '';
  setbirthDate(DateTime? birthDate) => this.birthDate = birthDate;

  setExperience(String? experience) => this.experience = experience ?? '';
  setSkills(String? skills) => this.skills = skills ?? '';
  setPhoneNumber(String? phoneNumber) => this.phoneNumber = phoneNumber ?? '';
  setCountry(String? country) => this.country = country ?? '';
  setCity(String? city) => this.city = city ?? '';

  // TODO: creator
  //setCreator(String? creator) => this.creator = creator ?? '';
  @override
  String toString() => 'ModelUserAuth(email: $email, password: $password)';
  setFullName(String fullName) {
    fullName.split('');
    firstName = fullName[0];
    lastName = fullName[1];
  }

  String getFullName() => firstName! + ' ' + lastName!;

  ModelUserAuth.fromJson(Map<String, dynamic> json) {
    id = json[KeyApi.id];
    firstName = json[KeyApi.firstName];
    lastName = json[KeyApi.lastName];
    password = json[KeyApi.password];
    email = json[KeyApi.email];
    specialty = json[KeyApi.specialty];
    birthDate = json[KeyApi.birthDate];
    experience = json[KeyApi.experience];
    skills = json[KeyApi.skills];
    phoneNumber = json[KeyApi.phoneNumber];
    country = json[KeyApi.country];
    city = json[KeyApi.city];
    imageUrl = json[KeyApi.imageUrl];
    cvUrl = json[KeyApi.cvUrl];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyApi.firstName] = firstName;
    data[KeyApi.lastName] = lastName;
    data[KeyApi.password] = password;
    data[KeyApi.email] = email;
    data[KeyApi.phoneNumber] = phoneNumber;
    data[KeyApi.country] = country;
    data[KeyApi.city] = city;
    data[KeyApi.skills] = skills;
    data[KeyApi.experience] = experience;
    data[KeyApi.imageUrl] = imageUrl;
    data[KeyApi.cvUrl] = cvUrl;
    return null;
  }
}
