import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../packages/pages/Posts/models/post.dart';
import '../util/api_key.dart';

class DatabaseService {
  // Global Vars
  var currentUser = FirebaseAuth.instance.currentUser;
  //collection reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference companiesCollection =
      FirebaseFirestore.instance.collection('companies');
  final CollectionReference postsCollection =
      FirebaseFirestore.instance.collection('posts');

  // LOGS

  // setMailLog(var user) {
  //   usersCollection.add(user);
  // }

  setMessagesLog(var post) {
    postsCollection.add(post);
  }
  // TASKS

  Future<List<ModelPost>> getPosts() async {
    // Returns a list of tasks
    List<ModelPost> list = [];
    postsCollection
        .where("company", isEqualTo: currentUser?.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.map((doc) {
        ModelPost post = ModelPost(
          title: doc[KeyApi.title],
          requirements: doc[KeyApi.requirements],
          description: doc[KeyApi.description],
          rangeSalary: doc[KeyApi.rangeSalary],
          rangeSalaryStart: doc[KeyApi.rangeSalaryStart],
          rangeSalaryEnd: doc[KeyApi.rangeSalaryEnd],
          type: doc[KeyApi.type],
          subType: doc[KeyApi.subType],
          //creator: doc[KeyApi.creator],
          status: doc[KeyApi.status],
        );
        list.add(post);
      });
    });
    return list;
  }

  dynamic addPost(data) {
    // Add a task to the tasks list
    return postsCollection
        .add(data)
        .then((value) => value)
        // ignore: invalid_return_type_for_catch_error, avoid_print
        .catchError((error) => print("Failed to add post: $error"));
  }

  // OWNER USERS
  dynamic getCompanyPosts() {
    // Returns a list of owner users
    return postsCollection
        .where({'company_id': currentUser?.uid})
        .get()
        .then((QuerySnapshot querySnapshot) {
          List list = [];
          for (var doc in querySnapshot.docs) {
            list.add(doc);
          }
          return list;
        });
  }

  dynamic addCompanyUser(workerId, ownerId) {
    final now = DateTime.now();
    Map<String, dynamic> data = {
      "creation_date": now,
      "isDeleted": false,
      "owner": ownerId,
      "worker": workerId
    };
    return companiesCollection
        .doc(ownerId + workerId)
        .set(data)
        .then((value) => value)
        // ignore: invalid_return_type_for_catch_error, avoid_print
        .catchError((error) => print("Failed to add user: $error"));
  }

  dynamic deleteCompanyUser(workerId, ownerId) {
    return companiesCollection
        .doc(ownerId + workerId)
        .delete()
        .then((value) => value)
        // ignore: invalid_return_type_for_catch_error, avoid_print
        .catchError((error) => print("Failed to add user: $error"));
  }
}
