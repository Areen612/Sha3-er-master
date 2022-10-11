import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shagher/controller/job_controller.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';
import 'package:shagher/packages/pages/company/views/add_post_widget.dart';
import 'package:shagher/service/provider/post_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyHomeWidget extends StatefulWidget {
  const CompanyHomeWidget({Key? key}) : super(key: key);

  @override
  State<CompanyHomeWidget> createState() => _CompanyHomeWidgetState();
}

class _CompanyHomeWidgetState extends State<CompanyHomeWidget> {
  String? email;
  bool isVerified = true;
  SharedPreferences? prefs;
  _handleDeletepost(post) async {
    await FirebaseFirestore.instance.collection("posts").doc(post.id).delete();
    //  DocumentSnapshot doc = await FirebaseFirestore.instance.collection('posts').doc(post.id).get()
    // print("Object has been deleted!");
  }

  _handleGetpost(post) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('posts').doc(post.id).get();

    // print("post get!");
  }

  @override
  void initState() {
    super.initState();

    email = FirebaseAuth.instance.currentUser!.email;
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    setSharedPreferences();
  }

  setSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPostWidget()));
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: Visibility(
                    visible: !isVerified,
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      color: Colors.orange,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Please verify your email address",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              child: const Text(
                                "Resend",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () async {
                                await FirebaseAuth.instance.currentUser!
                                    .sendEmailVerification();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GetX<PostControlleer>(
                    init: Get.put(PostControlleer()),
                    builder: (_con) {
                      return Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _con.getPostList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return PostCard(
                                index: index,
                                //! fix this
                                data: _con.getPostList[index],
                                //  ModelPost.fromQueryDocumentSnapshot(
                                //     data.docs[index]),
                                isComp: true,
                              );
                            }),
                      );
                    }),
                // StreamBuilder(
                //   stream: FirebaseFirestore.instance
                //       .collection("posts")
                //       .where("status", isEqualTo: 1)
                //       .snapshots(),
                //   builder: (BuildContext context,
                //       AsyncSnapshot<QuerySnapshot> snapshot) {
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
                //       return Container(
                //         height: 400,
                //         child: ListView.builder(
                //             itemCount: data.size,
                //             itemBuilder: (BuildContext context, int index) {
                //               return PostCard(
                //                 index: index,
                //                 //! fix this
                //                 data: ModelPost.fromQueryDocumentSnapshot(
                //                     data.docs[index]),
                //                 isComp: true,
                //               );
                //             }),
                //       );
                //     }
                //     return Container();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
