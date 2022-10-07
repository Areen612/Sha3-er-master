import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shagher/themes/app_colors.dart';

class CommentChild extends StatelessWidget {
  const CommentChild({Key? key, dynamic data})
      : _data = data,
        super(key: key);
  final dynamic _data;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i < _data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(_data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                _data[i]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_data[i]['message']),
            ),
          )
      ],
    );
  }
}
