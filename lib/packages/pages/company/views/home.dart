import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';
import 'package:shagher/packages/pages/company/views/add_post_widget.dart';

class CompanyHomeWidget extends StatefulWidget {
  const CompanyHomeWidget({Key? key}) : super(key: key);

  @override
  State<CompanyHomeWidget> createState() => _CompanyHomeWidgetState();
}

class _CompanyHomeWidgetState extends State<CompanyHomeWidget> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Home Page")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPostWidget()));
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("posts")
            .where("status", isEqualTo: 1)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("There are an error occured"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.requireData;
            return ListView.builder(
                itemCount: data.size,
                itemBuilder: (BuildContext context, int index) {
                  return PostCard(
                    //! fix this
                    data: ModelPost.fromQueryDocumentSnapshot(data.docs[index]),
                    isComp: true,
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
