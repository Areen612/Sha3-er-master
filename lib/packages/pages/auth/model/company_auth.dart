import 'package:shagher/util/api_key.dart';

class ModelCompanyAuth {
  String? id;
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

  ModelCompanyAuth({
    this.id,
    this.companyName,
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
  });

  setCompanyName(String? companyName) => this.companyName = companyName ?? '';
  setPassword(String? password) => this.password = password ?? '';
  setEmail(String? email) => this.email = email ?? '';
  setSpecialty(String? specialty) => this.specialty = specialty ?? '';
  setCountry(String? country) => this.country = country ?? '';
  setCity(String? city) => this.city = city ?? '';
  setEnterpriseOwner(String? enterpriseOwner) =>
      this.enterpriseOwner = enterpriseOwner ?? '';
  setCommercialAddress(String? commercialAddress) =>
      this.commercialAddress = commercialAddress ?? '';
  setStatus(String? status) => this.status = status ?? '';
  setNationalInvestorNumber(String? nationalInvestorNumber) =>
      this.nationalInvestorNumber = nationalInvestorNumber ?? '';
  setCommercialNumber(String? commercialNumber) =>
      this.commercialNumber = commercialNumber ?? '';
  setCommercialName(String? commercialName) =>
      this.commercialName = commercialName ?? '';

  Map<String, dynamic> toMap() {
    return {
      KeyApi.id: id,
      KeyApi.companyName: companyName,
      KeyApi.password: password,
      KeyApi.email: email,
      KeyApi.specialty: specialty,
      KeyApi.country: country,
      KeyApi.city: city,
      KeyApi.enterpriseOwner: enterpriseOwner,
      KeyApi.commercialAddress: commercialAddress,
      KeyApi.status: status,
      KeyApi.nationalInvestorNumber: nationalInvestorNumber,
      KeyApi.commercialNumber: commercialNumber,
      KeyApi.commercialName: commercialName,
    };
  }

  ModelCompanyAuth.fromMap(Map<String, dynamic> data) {
    id = data[KeyApi.id];
    companyName = data[KeyApi.companyName];
    password = data[KeyApi.password];
    email = data[KeyApi.email];
    specialty = data[KeyApi.specialty];
    country = data[KeyApi.country];
    city = data[KeyApi.city];
    enterpriseOwner = data[KeyApi.enterpriseOwner];
    commercialAddress = data[KeyApi.commercialAddress];
    status = data[KeyApi.status];
    nationalInvestorNumber = data[KeyApi.nationalInvestorNumber];
    commercialNumber = data[KeyApi.commercialNumber];
    commercialName = data[KeyApi.commercialName];
  }
}
