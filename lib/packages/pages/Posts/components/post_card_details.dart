import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shagher/controller/apply_for_job_controller.dart';
import 'package:shagher/packages/components/button/elevated_btn.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/components/space/size_box_width.dart';
import 'package:shagher/packages/pages/Posts/components/company_profile_page.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';
import 'package:shagher/packages/pages/auth/model/company_auth.dart';
import 'package:shagher/packages/pages/auth/model/user_auth.dart';
import 'package:shagher/packages/pages/company/views/add_post_widget.dart';
import 'package:shagher/packages/pages/company/views/requests.dart';
import 'package:shagher/service/theme/app_theme.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/util/api_key.dart';
import 'package:shagher/util/path_images.dart';
import 'package:shagher/widget/post_details_widget.dart';

import '../../../../language/generated/key_lang.dart';

// TODO refactor
class PostCardDetails extends StatefulWidget {
  final bool _isComp;
  final ModelPost? document;
  final int? index;
  const PostCardDetails({
    this.index,
    Key? key,
    bool isComp = false,
    this.document,
  })  : _isComp = isComp,
        super(key: key);

  @override
  State<PostCardDetails> createState() => _PostCardDetailsState();
}

class _PostCardDetailsState extends State<PostCardDetails> {
  ApplyJobsController applyJobsController = Get.put(ApplyJobsController());
  _handleMovetoEdit(post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => AddPostWidget(docment: post))));
  }

  _handleSoftDelete() async {
    await FirebaseFirestore.instance
        .collection("posts")
        .doc(widget.document!.id)
        .update({"status": 1});

    //print("Object has been updated!");
    Navigator.pop(context);
  }

  bool isGetData = false;

  ModelUserAuth loggedInUser = ModelUserAuth();
  ModelCompanyAuth modelCompanyAuth = ModelCompanyAuth();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    setState(() {
      isGetData = false;
    });
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.document!.id)
        .get()
        .then((value) {
      var docId = value.id;
      modelCompanyAuth = ModelCompanyAuth.fromMap(value.data()!);
      print('compna auth ${modelCompanyAuth.companyName}');
    });
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      var docId = value.id;
      loggedInUser = ModelUserAuth.fromMap(value.data()!);
      loggedInUser.setId(docId);
      //print('geee ${loggedInUser.specialty}');
      setState(() {
        isGetData = false;
      });
    }).catchError((e) {
      isGetData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ToDo post service
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          widget._isComp
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        _handleMovetoEdit(widget.document);
                      },
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.grey,
                      ),
                    ),
                  ))
              : Container(),
          const SBH(h: 20),
          Expanded(
            // flex: 1,
            child: !widget._isComp
                ? ListTile(
                    leading: const Hero(
                        tag: 'tag_card',
                        child:
                            Image(image: AssetImage(PathImages.profileImage))),
                    title: Text(widget.document!.title!,
                        style: AppTheme.h6(context)
                            .copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(widget.document!.requirements!,
                          style: AppTheme.b1(context)
                              .copyWith(fontWeight: FontWeight.w200)),
                    ),
                  )
                : ListTile(
                    title: Text(widget.document!.title!,
                        style: AppTheme.h6(context)
                            .copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(widget.document!.requirements!,
                          style: AppTheme.b1(context)
                              .copyWith(fontWeight: FontWeight.w200)),
                    ),
                  ),
          ),
          PostDetailsWidget(text: KeyApi.description.tr()),
          const SBH(h: 10),
          PostDetailsWidget(
            text: widget.document!
                .description, //'description', //widget.document[KeyApi.description],
            textTheme: 'b1',
          ),
          const SBH(h: 50),
          const PostDetailsWidget(
              text: 'Salary', // widget.document[KeyApi.rangeSalary]
              textTheme: 'h6'),
          const SBH(h: 10),
          PostDetailsWidget(
              text: widget
                  .document!.rangeSalary, //widget.document[KeyApi.rangeSalary],
              textTheme: 'b1'),
          const SBH(h: 200),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                !widget._isComp
                    ? ElevatedBtn(
                        title: 'Company Profile',
                        onTap: () {
                          Get.to(() => CompanyProfilePage(
                                companyAuth: modelCompanyAuth,
                              ));
                        },
                        width: 150,
                      )
                    : ElevatedBtn(
                        title: 'Requests',
                        onTap: () {
                          Get.to(() => RequestsWidget(
                                document: widget.document,
                              ));
                        },
                        // =>
                        //         Navigator.pushNamed(context, RequestsWidget.id),
                        width: 150,
                      ),
                const SBW(w: 20),
                !widget._isComp
                    ? ElevatedBtn(
                        title: 'Apply',
                        onTap: () {
                          print('docId is ${widget.document!.docId!} ');
                          applyJobsController.applyForJobs(
                            user!.uid,
                            widget.document!.docId!,
                            loggedInUser.role!,
                            loggedInUser.firstName!,
                            loggedInUser.lastName!,
                            loggedInUser.specialty!,
                            loggedInUser.email!,
                            loggedInUser.mobileNumber!,
                            loggedInUser.country!,
                            loggedInUser.city!,
                            loggedInUser.skills!,
                            loggedInUser.experience!,
                          );
                          // TODO implement this
                        },
                        width: 150,
                      )
                    : ElevatedBtn(
                        title: KeyLang.delete.tr(),
                        onTap: () {
                          _handleSoftDelete();
                        },
                        width: 150,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
