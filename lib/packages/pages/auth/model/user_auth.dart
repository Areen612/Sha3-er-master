import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shagher/util/api_key.dart';

class ModelUserAuth {
  String? userId;
  String? id;
  String? role;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  // * cv
  String? specialty;
  DateTime? birthDate;
  String? experience;
  String? skills;
  String? mobileNumber;
  String? country;
  String? city;
  String? imageUrl = 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';
  String? cvUrl;
  // String creator;
// List<ModelCv>? cv;

  ModelUserAuth({
    this.id,
    this.role,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.specialty,
    this.birthDate,
    this.experience,
    this.skills,
    this.mobileNumber,
    this.country,
    this.city,
    this.imageUrl,
    this.cvUrl,
  });
  setId(String? id) {
    this.id = id;
  }

  setFname(String? firstName) {
    this.firstName = firstName ?? '';
  }

  setRole(String? role) => this.role = role ?? '';
  setLname(String? lastName) => this.lastName = lastName ?? '';
  setEmail(String? email) => this.email = email ?? '';
  setPass(String? password) => this.password = password ?? '';
  setbirthDate(DateTime? birthDate) => this.birthDate = birthDate;
  setSpecialty(String? specialty) => this.specialty = specialty ?? '';
  setExperience(String? experience) => this.experience = experience ?? '';
  setSkills(String? skills) => this.skills = skills ?? '';
  setMobileNumber(String? mobileNumber) =>
      this.mobileNumber = mobileNumber ?? '';
  setCountry(String? country) => this.country = country ?? '';
  setCity(String? city) => this.city = city ?? '';
  setImageUrl(String? imageUrl) => this.imageUrl =
      imageUrl ?? 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';

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

  Map<String, dynamic> toMap() {
    return {
      KeyApi.id: id,
      KeyApi.role: role,
      KeyApi.firstName: firstName,
      KeyApi.lastName: lastName,
      KeyApi.password: password,
      KeyApi.specialty: specialty,
      KeyApi.email: email,
      KeyApi.mobileNumber: mobileNumber,
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
    role = data[KeyApi.role];
    firstName = data[KeyApi.firstName];
    lastName = data[KeyApi.lastName];
    password = data[KeyApi.password];
    email = data[KeyApi.email];
    specialty = data[KeyApi.specialty];
    mobileNumber = data[KeyApi.mobileNumber];
    country = data[KeyApi.country];
    city = data[KeyApi.city];
    skills = data[KeyApi.skills];
    experience = data[KeyApi.experience];
    imageUrl = data[KeyApi.imageUrl];
    cvUrl = data[KeyApi.cvUrl];
  }

  ModelUserAuth.fromQueryDocumentSnapshot(QueryDocumentSnapshot data) {
    // id = data[KeyApi.id];
    role = data[KeyApi.role];
    firstName = data[KeyApi.firstName];
    lastName = data[KeyApi.lastName];
    email = data[KeyApi.email];
    specialty = data[KeyApi.specialty];
    mobileNumber = data[KeyApi.mobileNumber];
    country = data[KeyApi.country];
    city = data[KeyApi.city];
    skills = data[KeyApi.skills];
    experience = data[KeyApi.experience];
    // imageUrl = data[KeyApi.imageUrl];
    //cvUrl = data[KeyApi.cvUrl];
  }
}
