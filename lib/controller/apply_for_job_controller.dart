import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shagher/packages/pages/auth/model/user_auth.dart';

import '../util/api_key.dart';

class ApplyJobsController extends GetxController {
  Rx<List<ModelUserAuth>> userslist = Rx<List<ModelUserAuth>>([]);
  List<ModelUserAuth> get getuserslist => userslist.value;
  applyForJobs(
    String userId,
    String jobId,
    String role,
    String firstName,
    String lastName,
    String specialty,
    String email,
    String mobileNumber,
    String country,
    String city,
    String skills,
    String experience,
    // String imageUrl,
    // String cvUrl
  ) {
    Map<String, dynamic> userData = {
      KeyApi.role: role,
      KeyApi.firstName: firstName,
      KeyApi.lastName: lastName,
      KeyApi.specialty: specialty,
      KeyApi.email: email,
      KeyApi.mobileNumber: mobileNumber,
      KeyApi.country: country,
      KeyApi.city: city,
      KeyApi.skills: skills,
      KeyApi.experience: experience,
      // KeyApi.imageUrl: imageUrl,
      // KeyApi.cvUrl: cvUrl,
    };

    FirebaseFirestore.instance
        .collection('posts')
        .doc(jobId)
        .collection('allUsers')
        .doc(userId)
        .set(userData)
        .then((value) {
      Get.back();
      Get.snackbar('Job Applied', 'You successfuly applied for this job');
    }).catchError((e) {
      Get.snackbar('Error', e.toString());
    });
  }

  getAllUsers(String postId) {
    userslist.bindStream(getusersStream(postId));
  }

  Stream<List<ModelUserAuth>> getusersStream(String postId) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('allUsers')
        .snapshots()
        .map((event) {
      List<ModelUserAuth> retVal = [];
      for (var element in event.docs) {
        retVal.add(ModelUserAuth.fromQueryDocumentSnapshot(element));
      }
      print('users length is ${retVal.length}');

      return retVal;

      //return event;
    });
  }
}
