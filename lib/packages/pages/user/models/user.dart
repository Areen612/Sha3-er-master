import 'package:shagher/packages/pages/cv/models/cv.dart';

class User {
  String? firstName;
  String? lastName;
  String? password;
  String? imageUrl;
  String? email;
  List<ModelCv>? cv;

  User({
    this.firstName,
    this.lastName,
    this.password,
    this.imageUrl,
    this.email,
    this.cv,
  });
}
