import 'package:comment_box/comment/comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shagher/packages/components/comment_box/comment_child.dart';
import 'package:shagher/themes/app_colors.dart';

class CommentsBox extends StatefulWidget {
  const CommentsBox({Key? key}) : super(key: key);

  @override
  State<CommentsBox> createState() => _ReviewsState();
}

class _ReviewsState extends State<CommentsBox> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  //ModelUser user = ModelUser();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
      'message': 'Very cool'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CommentBox(
          userImage: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
          child: CommentChild(
            data: filedata,
          ),
          labelText: 'Write a review...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'user', // user!.displayName,
                  'pic':
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: AppColors.bgWhite,
          textColor: AppColors.black,
          sendWidget:
              Icon(Icons.send_sharp, size: 30, color: AppColors.primary),
        ),
      ),
    );
  }
}
