import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/user/views/user_profile.dart';

import '../../../../util/api_key.dart';

class RequestsWidget extends StatefulWidget {
  static const String id = 'requests';
  const RequestsWidget({Key? key}) : super(key: key);

  @override
  State<RequestsWidget> createState() => RequestsWidgetState();
}

class RequestsWidgetState extends State<RequestsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          //.where("userId", isEqualTo: prefs!.getString("userId"))
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
                return ListTile(
                    title: Text("${data.docs[index][KeyApi.firstName]}"),
                    leading: Image.network(data.docs[index][KeyApi.imageUrl]),
                    trailing: GestureDetector(
                      child: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UserProfile(// TODO send user id
                                        )));
                      },
                    ));
              });
        }
        return Container();
      },
    );
  }
}
