// import 'package:shagher/packages/pages/cv/models/cv.dart';
// import 'package:shagher/util/api_key.dart';

// class ModelUser {
//   String? uid;
//   String? firstName;
//   String? lastName;
//   String? password;
//   String? email;
//   String? imageUrl;
//   ModelCv? cv;

//   ModelUser(
//       {this.uid,
//       this.firstName,
//       this.lastName,
//       this.password,
//       this.email,
//       this.imageUrl,
//       this.cv});

//   ModelUser.fromJson(Map<String, dynamic> json) {
//     firstName = json[KeyApi.firstName];
//     lastName = json[KeyApi.lastName];
//     password = json[KeyApi.password];
//     email = json[KeyApi.email];
//     if (json[KeyApi.cv] != null) {
//       cv = [];
//       json[KeyApi.cv].forEach(
//         (v) {
//           cv?.add(ModelCv.fromJson(v));
//         },
//       );
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data[KeyApi.firstName] = firstName;
//     data[KeyApi.lastName] = lastName;
//     data[KeyApi.password] = password;
//     data[KeyApi.email] = email;
//     if (cv != null) {
//       data[KeyApi.cv] = cv?.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
