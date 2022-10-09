import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shagher/packages/components/button/elevated_btn.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/components/space/size_box_width.dart';
import 'package:shagher/packages/pages/company/views/add_post_widget.dart';
import 'package:shagher/packages/pages/company/views/requests.dart';
import 'package:shagher/packages/pages/user/views/company_profile.dart';
import 'package:shagher/service/theme/app_theme.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/util/api_key.dart';
import 'package:shagher/util/path_images.dart';
import 'package:shagher/widget/post_details_widget.dart';

import '../../../../language/generated/key_lang.dart';

// TODO refactor
class PostCardDetails extends StatefulWidget {
  final bool _isComp;
  final dynamic document;
  const PostCardDetails({Key? key, bool isComp = false, this.document})
      : _isComp = isComp,
        super(key: key);

  @override
  State<PostCardDetails> createState() => _PostCardDetailsState();
}

class _PostCardDetailsState extends State<PostCardDetails> {
  @override
  Widget build(BuildContext context) {
    _handleMovetoEdit(post) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => AddPostWidget(docment: post))));
    }

    _handleSoftDelete() async {
      await FirebaseFirestore.instance
          .collection("posts")
          .doc(widget.document.id)
          .update({"status": 1});

      //print("Object has been updated!");
      Navigator.pop(context);
    }

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
                      onTap: _handleMovetoEdit(widget.document),
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
                    title: Text('Flutter Developer',
                        style: AppTheme.h6(context)
                            .copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Text('Company 1',
                        style: AppTheme.s1(context)
                            .copyWith(fontWeight: FontWeight.w200)),
                  )
                : ListTile(
                    title: Text('Flutter Developer',
                        style: AppTheme.h6(context)
                            .copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Text('Company 1',
                        style: AppTheme.s1(context)
                            .copyWith(fontWeight: FontWeight.w200)),
                  ),
          ),
          PostDetailsWidget(text: KeyApi.description.tr()),
          const SBH(h: 10),
          PostDetailsWidget(
            text: widget.document[KeyApi.description],
            textTheme: 'b1',
          ),
          const SBH(h: 50),
          PostDetailsWidget(
              text: widget.document[KeyApi.rangeSalary], textTheme: 'h6'),
          const SBH(h: 10),
          PostDetailsWidget(
              text: widget.document[KeyApi.rangeSalary], textTheme: 'b1'),
          const SBH(h: 200),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                !widget._isComp
                    ? ElevatedBtn(
                        title: 'Company Profile',
                        onTap: () => Navigator.popAndPushNamed(
                            context, CompanyProfileUser.id),
                        width: 150,
                      )
                    : ElevatedBtn(
                        title: 'Requests',
                        onTap: () =>
                            Navigator.pushNamed(context, RequestsWidget.id),
                        width: 150,
                      ),
                const SBW(w: 20),
                !widget._isComp
                    ? ElevatedBtn(
                        title: 'Apply',
                        onTap: () {
                          // TODO implement this
                        },
                        width: 150,
                      )
                    : ElevatedBtn(
                        title: KeyLang.delete.tr(),
                        onTap: () => _handleSoftDelete,
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
