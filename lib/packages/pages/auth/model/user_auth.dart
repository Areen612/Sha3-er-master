import 'package:shagher/util/api_key.dart';

class ModelUserAuth {
  String? id;
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
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.specialty,
    this.birthDate,
    this.experience,
    this.skills,
    this.phoneNumber,
    this.country,
    this.city,
    this.imageUrl,
    this.cvUrl,
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

  Map<String, dynamic>? toMap() {
    return {
      KeyApi.id: id,
      KeyApi.firstName: firstName,
      KeyApi.lastName: lastName,
      KeyApi.password: password,
      KeyApi.email: email,
      KeyApi.phoneNumber: phoneNumber,
      KeyApi.country: country,
      KeyApi.city: city,
      KeyApi.skills: skills,
      KeyApi.experience: experience,
      KeyApi.imageUrl: imageUrl,
      KeyApi.cvUrl: cvUrl,
    };
  }

  ModelUserAuth.fromMap(Map<String, dynamic> data) {
    id = data[KeyApi.id];
    firstName = data[KeyApi.firstName];
    lastName = data[KeyApi.lastName];
    password = data[KeyApi.password];
    email = data[KeyApi.email];
    phoneNumber = data[KeyApi.phoneNumber];
    country = data[KeyApi.country];
    city = data[KeyApi.city];
    skills = data[KeyApi.skills];
    experience = data[KeyApi.experience];
    imageUrl = data[KeyApi.imageUrl];
    cvUrl = data[KeyApi.cvUrl];
  }
}
