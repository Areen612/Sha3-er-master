import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shagher/packages/components/loading/loading_page.dart';
import 'package:shagher/packages/components/toast/custom_toast.dart';
import 'package:shagher/packages/pages/company/views/landscape.dart';
import 'package:shagher/packages/pages/home/views/body.dart';

class ManageRole extends StatefulWidget {
  static const String id = 'ManageRole';
  const ManageRole({Key? key}) : super(key: key);

  @override
  State<ManageRole> createState() => _ManageRoleState();
}

class _ManageRoleState extends State<ManageRole> {
  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic>? userData = <String, dynamic>{};
  dynamic loginuser;

  late Future<Map<dynamic, dynamic>> fixtures;

  @override
  void initState() {
    fixtures = _getData();
    super.initState();
  }

  Future<Map<dynamic, dynamic>> _getData() async {
    return await fetchData();
  }

  @override
  Future<Object>? getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    Future userData;
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    print('here document $document');
    return userData = document.data() as Future;
  }

  Future<Map<String, dynamic>> fetchData() async {
    var value = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    return value as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;
    // DocumentReference document =
    //     FirebaseFirestore.instance.collection('users').doc(user!.uid);
    // Map<String, dynamic>? temp = document.data as Map<String, dynamic>;
    // var userRole = getUserData();
    // if (userRole!['role'] == 'user') {
    //   return const UserLandScape();
    // } else if (userRole!['role'] == 'company') {
    //   return const CompanyLandScape();
    // }

    return FutureBuilder(
        future: fixtures,
        builder: (BuildContext context,
            AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          }
          if (snapshot.hasData) {
            print('here object ${snapshot.data}');
            Map<String, dynamic> user = snapshot.data as Map<String, dynamic>;
            print('here user $user');
            print('here user role ${user['role']}');
            if (user['role'] == 'user') {
              return const UserLandScape();
            } else if (user['role'] == 'company') {
              return const CompanyLandScape();
            }
          }
          if (snapshot.hasError) {
            errorToast('No data available for user ');
          }
          return const LoadingPage();
        });
  }
}

void _navHome(BuildContext context) =>
    Navigator.pushReplacementNamed(context, UserLandScape.id);

// * Navigator Home Page
void _navCompany(BuildContext context) =>
    Navigator.pushReplacementNamed(context, CompanyLandScape.id);


//   // @override
//   // void initState() {
//   //   super.initState();
//   //   print('user here $user');
//   //   FirebaseFirestore.instance
//   //       .collection('users')
//   //       .doc(user!.uid)
//   //       .get()
//   //       .then((value) {
//   //     print('valuee ${value.data()}');
//   //     Map<String, dynamic>? temp = value.data();

//   //     if (temp!['role'] == 'user') {
//   //       loginuser = ModelUserAuth.fromMap(value.data()!);
//   //     } else if (temp['role'] == 'company') {
//   //       loginuser = ModelCompanyAuth.fromMap(value.data()!);
//   //     }
//   //     print(' login user $loginuser');
//   //   }).catchError((e) {
//   //     print('xxxxx' + e);
//   //   });
//   // }
