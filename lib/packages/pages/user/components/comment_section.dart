import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../themes/app_colors.dart';
import '../../../../widget/comments_widget.dart';
import '../../../components/space/size_box_height.dart';
import '../../../components/toast/custom_toast.dart';

class Reviews extends StatefulWidget {
  final String? compnayID;

  const Reviews({Key? key, this.compnayID}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  final TextEditingController _commentController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool showComment = false;
  bool _isCommenting = false;
  String? name;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 500,
            ),
            child: _isCommenting
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6.3),
                          child: TextField(
                            controller: _commentController,
                            maxLength: 200,
                            keyboardType: TextInputType.multiline,
                            maxLines: 1,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.secondary),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primary),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: MaterialButton(
                                onPressed: () async {
                                  if (_commentController.text.length < 7) {
                                    errorToast(
                                        'Comment cannot be less than 7 characters');
                                  }
                                  // TODO firebase
                                  else {
                                    final _generatedId = const Uuid().v4();
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        // .where(
                                        //     'role' == 'company')
                                        .doc(widget.compnayID)
                                        .update({
                                      'CompanyReviews': FieldValue.arrayUnion([
                                        {
                                          'userId': FirebaseAuth
                                              .instance.currentUser!.uid,
                                          'commentId': _generatedId,
                                          'userName': name,
                                          'userImageUrl': imageUrl,
                                          'commentBody':
                                              _commentController.text,
                                          'time': Timestamp.now(),
                                        }
                                      ]),
                                    });
                                    await Fluttertoast.showToast(
                                      msg: 'Your comment has been added',
                                      toastLength: Toast.LENGTH_LONG,
                                      backgroundColor: Colors.grey,
                                      fontSize: 18.0,
                                    );
                                    _commentController.clear();
                                  }
                                  setState(() {
                                    showComment = true;
                                  });
                                },
                                color: AppColors.primary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'Post',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isCommenting = !_isCommenting;
                                  showComment = false;
                                });
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isCommenting = !_isCommenting;
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.plus,
                          //Icons.add_comment,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showComment = true;
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.solidComment,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
          ),
          const SBH(h: 14),
          showComment == false
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FutureBuilder<DocumentSnapshot>(
                    // TODO: firebase
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(widget.compnayID)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.data == null) {
                          const Center(
                            child: Text('No Comment for this job'),
                          );
                        }
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CommentWidget(
                            commentId: snapshot.data!['companyComments'][index]
                                ['commentId'],
                            commenterId: snapshot.data!['companyComments']
                                [index]['userId'],
                            commenterName: snapshot.data!['companyComments']
                                [index]['name'],
                            commentBody: snapshot.data!['companyComments']
                                [index]['commentBody'],
                            commenterImageUrl: snapshot.data!['companyComments']
                                [index]['userImageUrl'],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          );
                        },
                        itemCount: snapshot.data!['companyComments'].length,
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
