import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shagher/util/api_key.dart';

class ModelPost {
  String? id;
  String? title;
  String? requirements;
  String? description;
  String? rangeSalary;
  double? rangeSalaryStart;
  double? rangeSalaryEnd;
  String? type;
  String? subType;
  String? creator;
  int? status;

  ModelPost({
    this.id,
    this.title,
    this.requirements,
    this.description,
    this.rangeSalary,
    this.rangeSalaryStart,
    this.rangeSalaryEnd,
    this.type,
    this.subType,
    this.creator,
    this.status,
  });

  setTitle(String? title) => this.title = title ?? '';
  setRequirements(String? requirements) =>
      this.requirements = requirements ?? '';
  setDescription(String? description) => this.description = description ?? '';
  setRangeSalary(String? rangeSalary) => this.rangeSalary = rangeSalary ?? '';
  setRangeSalaryStart(double? rangeSalaryStart) =>
      this.rangeSalaryStart = rangeSalaryStart ?? 0.0;
  setRangeSalaryEnd(double? rangeSalaryEnd) =>
      this.rangeSalaryEnd = rangeSalaryEnd ?? 0.0;
  setType(String? type) => this.type = type ?? '';
  setSubType(String? type) => this.type = type ?? '';
  setStatus(int? status) => this.status = status ?? 0;

  Map<String, dynamic> toMap() {
    return {
      KeyApi.id: id,
      KeyApi.title: title,
      KeyApi.requirements: requirements,
      KeyApi.description: description,
      KeyApi.rangeSalary: rangeSalary,
      KeyApi.rangeSalaryStart: rangeSalaryStart,
      KeyApi.rangeSalaryEnd: rangeSalaryEnd,
      KeyApi.type: type,
      KeyApi.subType: subType,
      KeyApi.creator: creator,
      KeyApi.status: status,
    };
  }

  ModelPost.fromMap(Map<String, dynamic> data) {
    id = data[KeyApi.id];
    title = data[KeyApi.title];
    requirements = data[KeyApi.requirements];
    description = data[KeyApi.description];
    rangeSalary = data[KeyApi.rangeSalary];
    rangeSalaryStart = data[KeyApi.rangeSalaryStart];
    rangeSalaryEnd = data[KeyApi.rangeSalaryEnd];
    type = data[KeyApi.type];
    subType = data[KeyApi.subType];
    creator = data[KeyApi.creator];
    status = data[KeyApi.status];
  }

  ModelPost.fromQueryDocumentSnapshot(QueryDocumentSnapshot data) {
    id = data[KeyApi.id];
    title = data[KeyApi.title];
    requirements = data[KeyApi.requirements];
    description = data[KeyApi.description];
    rangeSalary = data[KeyApi.rangeSalary];
    rangeSalaryStart = data[KeyApi.rangeSalaryStart];
    rangeSalaryEnd = data[KeyApi.rangeSalaryEnd];
    type = data[KeyApi.type];
    subType = data[KeyApi.subType];
    creator = data[KeyApi.creator];
    status = data[KeyApi.status];
  }
}
