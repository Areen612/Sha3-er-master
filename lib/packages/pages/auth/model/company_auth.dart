class ModelCompanyAuth {
  String companyName;
  String password;
  String email;
  String specialty;
  String country;
  String city;
  String enterpriseOwner;
  String commercialAddress;
  String status;
  String nationalInvestorNumber;
  String commercialNumber;
  String commercialName;

  ModelCompanyAuth({
    this.companyName = '',
    this.password = '',
    this.email = '',
    this.specialty = '',
    this.country = '',
    this.city = '',
    this.enterpriseOwner = '',
    this.commercialAddress = '',
    this.status = '',
    this.nationalInvestorNumber = '',
    this.commercialNumber = '',
    this.commercialName = '',
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
}
