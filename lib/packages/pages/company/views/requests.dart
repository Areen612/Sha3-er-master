import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shagher/controller/apply_for_job_controller.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';
import 'package:shagher/packages/pages/company/views/view_requested_user_profile.dart';

class RequestsWidget extends StatefulWidget {
  static const String id = 'requests';
  const RequestsWidget({Key? key, this.document}) : super(key: key);

  final ModelPost? document;

  @override
  State<RequestsWidget> createState() => RequestsWidgetState();
}

class RequestsWidgetState extends State<RequestsWidget> {
  ApplyJobsController applyJobsController = Get.put(ApplyJobsController());

  @override
  void initState() {
    super.initState();
    applyJobsController.getAllUsers(widget.document!.docId!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Requests'),
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const SBH(h: 10),
              GetX<ApplyJobsController>(
                  init: Get.put(ApplyJobsController()),
                  builder: (_con) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _con.getuserslist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                                title:
                                    Text(_con.getuserslist[index].firstName!),
                                leading: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.network(
                                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                                ),
                                trailing: GestureDetector(
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RequestedUserProfile(
                                                  modelUserAuth:
                                                      _con.getuserslist[index],
                                                )));
                                  },
                                )),
                          );
                        });
                  })
            ],
          ),
        ),
      ),
    );

    // StreamBuilder(
    //   stream: FirebaseFirestore.instance
    //       .collection("users")
    //       //.where("userId", isEqualTo: prefs!.getString("userId"))
    //       .snapshots(),
    //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     if (snapshot.hasError) {
    //       return const Center(
    //         child: Text("There are an error occured"),
    //       );
    //     }

    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.connectionState == ConnectionState.active ||
    //         snapshot.connectionState == ConnectionState.done) {
    //       final data = snapshot.requireData;
    //       return ListView.builder(
    //           itemCount: data.size,
    //           itemBuilder: (BuildContext context, int index) {
    //             return ListTile(
    //                 title: Text("${data.docs[index][KeyApi.firstName]}"),
    //                 leading: Image.network(data.docs[index][KeyApi.imageUrl]),
    //                 trailing: GestureDetector(
    //                   child: const Icon(
    //                     Icons.arrow_forward_ios,
    //                   ),
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) =>
    //                                 const UserProfile(// TODO send user id
    //                                     )));
    //                   },
    //                 ));
    //           });
    //     }
    //     return Container();
    //   },
    // );
  }
}
