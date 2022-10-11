import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';
import 'package:shagher/util/api_key.dart';

class PostControlleer extends GetxController {
  Rx<List<ModelPost>> postList = Rx<List<ModelPost>>([]);
  List<ModelPost> get getPostList => postList.value;

  Rx<List<ModelPost>> jobList = Rx<List<ModelPost>>([]);
  List<ModelPost> get getjobList => jobList.value;

  Rx<List<ModelPost>> paidTraining = Rx<List<ModelPost>>([]);
  List<ModelPost> get getPaidTraining => paidTraining.value;

  Rx<List<ModelPost>> upPaidTraining = Rx<List<ModelPost>>([]);
  List<ModelPost> get getUpPaidTraining => upPaidTraining.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    postList.bindStream(getpostStream());
    jobList.bindStream(getJobStream());
    paidTraining.bindStream(getPaidTraingStream());
    upPaidTraining.bindStream(getUnPaidTraingStream());
  }

  // <============ ADD JOB =============>
  void addPost({
    required String id,
    required String title,
    required String requirements,
    required String description,
    required String rangeSalary,
    required double rangeSalaryStart,
    required double rangeSalaryEnd,
    required String type,
    required String subType,
    required String creator,
    required int status,
  }) {
    Map<String, dynamic> jobData = {
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

    FirebaseFirestore.instance.collection("posts").add(jobData).then((value) {
      Get.snackbar('Job added', 'job added successfully');
    }).catchError((e) {
      Get.snackbar('Error', e.toString());
    });
  }

  // <============ GEt ALL JOB for company =============>

  Stream<List<ModelPost>> getpostStream() {
    return FirebaseFirestore.instance
        .collection('posts')
        .snapshots()
        .map((event) {
      List<ModelPost> retVal = [];
      for (var element in event.docs) {
        retVal.add(ModelPost.fromQueryDocumentSnapshot(element));
      }
      print('post length is ${retVal.length}');

      return retVal;

      //return event;
    });
  }

  // <============ GEt  JOB for User =============>

  Stream<List<ModelPost>> getJobStream() {
    return FirebaseFirestore.instance
        .collection('posts')
        .where('type', isEqualTo: 'Job')
        .snapshots()
        .map((event) {
      List<ModelPost> retVal = [];
      for (var element in event.docs) {
        retVal.add(ModelPost.fromQueryDocumentSnapshot(element));
      }
      print('job length is ${retVal.length}');

      return retVal;

      //return event;
    });
  }

  // <============ GEt  PAID TRAINING =============>

  Stream<List<ModelPost>> getPaidTraingStream() {
    return FirebaseFirestore.instance
        .collection('posts')
        .where('type', isEqualTo: 'Training')
        .where('subType', isEqualTo: 'Paid')
        .snapshots()
        .map((event) {
      List<ModelPost> retVal = [];
      for (var element in event.docs) {
        retVal.add(ModelPost.fromQueryDocumentSnapshot(element));
      }
      print('paid length is ${retVal.length}');

      return retVal;

      //return event;
    });
  }

  // <============ GEt  UNPAID TRAINING =============>

  Stream<List<ModelPost>> getUnPaidTraingStream() {
    return FirebaseFirestore.instance
        .collection('posts')
        .where('type', isEqualTo: 'Training')
        .where('subType', isEqualTo: 'Unpaid')
        .snapshots()
        .map((event) {
      List<ModelPost> retVal = [];
      for (var element in event.docs) {
        retVal.add(ModelPost.fromQueryDocumentSnapshot(element));
      }
      print('unPaid length is ${retVal.length}');

      return retVal;

      //return event;
    });
  }
}
