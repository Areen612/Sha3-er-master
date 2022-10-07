import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shagher/packages/components/toast/custom_toast.dart';
import 'package:shagher/packages/pages/auth/model/company_auth.dart';
import 'package:shagher/packages/pages/company/views/landscape.dart';
import 'package:shagher/packages/pages/home/views/body.dart';

import '../model/user_auth.dart';

class ManageRole extends StatefulWidget {
  static const String id = 'ManageRole';
  const ManageRole({Key? key}) : super(key: key);

  @override
  State<ManageRole> createState() => _ManageRoleState();
}

class _ManageRoleState extends State<ManageRole> {
  User? user = FirebaseAuth.instance.currentUser;

  dynamic loginuser;

  @override
  void initState() {
    super.initState();
    print('user here $user');
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      print('valuee ${value.data()}');
      Map<String, dynamic>? temp = value.data();

      if (temp!['role'] == 'user') {
        loginuser = ModelUserAuth.fromMap(value.data()!);
      } else if (temp['role'] == 'company') {
        loginuser = ModelCompanyAuth.fromMap(value.data()!);
      }
      print(' login user $loginuser');
    }).catchError((e) {
      print('xxxxx' + e);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loginuser.role == "user") {
      _navHome(context);
    } else if (loginuser.role == "company") {
      _navCompany(context);
    } else {
      errorToast('user is not found');
    }
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

void _navHome(BuildContext context) =>
    Navigator.pushReplacementNamed(context, UserLandScape.id);

// * Navigator Home Page
void _navCompany(BuildContext context) =>
    Navigator.pushReplacementNamed(context, CompanyLandScape.id);
