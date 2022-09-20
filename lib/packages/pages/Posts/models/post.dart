class ModelPost {
  int id;
  String title;
  String requirements;
  String rangeSalary;
  String type;
  // ModelCompany? creator;

  ModelPost({
    required this.id,
    this.title = '',
    this.requirements = '',
    this.rangeSalary = '',
    this.type = '',
    //this.creator
  });

  setTitle(String? title) => this.title = title ?? '';
  setRequirements(String? requirements) =>
      this.requirements = requirements ?? '';
  setRangeSalary(String? rangeSalary) => this.rangeSalary = rangeSalary ?? '';
  setType(String? type) => this.type = type ?? '';
}
