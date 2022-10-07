// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shagher/util/api_key.dart';

// import '../packages/pages/user/models/user.dart';

// class UserHelper {
//   static final FirebaseFirestore _db = FirebaseFirestore.instance;

//   static saveUser(ModelUser user) async {
//     Map<String, dynamic> userData = {
//       KeyApi.firstName: user.firstName,
//       KeyApi.email: user.email,
//       KeyApi.imageUrl: user.imageUrl,
//       KeyApi.id: user.uid,
//       KeyApi.role: "user",
//     };
//     final userRef = _db.collection("users").doc(user.uid);
//     if ((await userRef.get()).exists) {
//       await _db.collection("users").doc(user.uid).set(userData);
//     }
//   }
// }
