import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shagher/util/api_key.dart';
import '../../packages/pages/Posts/models/post.dart';
import '../../packages/pages/user/models/user.dart';

class FireStoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> savePost(ModelPost post) {
    return _db.collection('posts').doc(post.id).set(post.toMap());
  }

  Stream<ModelPost> streamPost(String id) {
    return _db
        .collection('posts')
        .doc(id)
        .snapshots()
        .map((snap) => ModelPost.fromMap(snap.data as Map));
  }

  // * get User Data
  Stream<ModelUser> streamUser(String id) {
    return _db
        .collection('users')
        .doc(id)
        .snapshots()
        .map((snap) => ModelUser.fromMap(snap.data as Map));
  }

  // TODO: ----
  Stream<List<ModelPost>> getPosts() {
    return _db.collection('posts').snapshots().map((snapshot) => snapshot.docs
        .map((document) => ModelPost.fromMap(document.data()))
        .toList());
  }

  Future<void> removeItem(String postId) {
    return _db.collection('posts').doc(postId).delete();
  }

  // Future<void>? addRole(String role, id) {
  //   var user = _auth.currentUser;

  //   role == 'user'
  //       ? _db.collection('roles').add({KeyApi.role: KeyApi.user})
  //       : _db.collection('roles').add({KeyApi.role: KeyApi.company});
  //   return null;
  // }

  saveUser(ModelUser user) async {
    Map<String, dynamic> userData = {
      KeyApi.firstName: user.firstName,
      KeyApi.email: user.email,
      KeyApi.imageUrl: user.imageUrl,
      KeyApi.id: user.uid,
      //  KeyApi.role: await SharedPreference.getCompany ? 'company' : "user",
    };
    final userRef = _db.collection("users").doc(user.uid);
    if ((await userRef.get()).exists) {
      await _db.collection("users").doc(user.uid).set(userData);
    }
  }
}
