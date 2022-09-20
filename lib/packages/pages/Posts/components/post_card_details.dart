import 'package:flutter/material.dart';
import 'package:shagher/packages/components/button/elevated_btn.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/components/space/size_box_width.dart';
import 'package:shagher/packages/pages/company/views/requests.dart';
import 'package:shagher/packages/pages/user/views/company_profile.dart';
import 'package:shagher/service/theme/app_theme.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/util/path_images.dart';
import 'package:shagher/widget/post_details_widget.dart';

// TODO refactor
class PostCardDetails extends StatelessWidget {
  const PostCardDetails({Key? key, bool isComp = false})
      : _isComp = isComp,
        super(key: key);

  final bool _isComp;
  @override
  Widget build(BuildContext context) {
    // ToDo post service
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _isComp
              ? const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Icon(
                        Icons.edit,
                        color: AppColors.grey,
                      ),
                    ),
                  ))
              : Container(),
          const SBH(h: 20),
          Expanded(
            // flex: 1,
            child: !_isComp
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
          //const SBH(h: 10),
          const PostDetailsWidget(text: 'Description:'),
          const SBH(h: 10),
          const PostDetailsWidget(
            text:
                'description increments by 1 for each child in the container and by 1 for each child in the container and by 1 for each child in the container and by 1 for each child in the container and by 1 for each child',
            //all: true,
            textTheme: 'b1',
          ),
          const SBH(h: 50),
          const PostDetailsWidget(text: 'Range Salary:', textTheme: 'h6'),
          const SBH(h: 10),
          const PostDetailsWidget(
            text: '400-600',
            //all: true,
            textTheme: 'b1',
          ),
          const SBH(h: 200),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                !_isComp
                    ? ElevatedBtn(
                        title: 'Company Profile',
                        onTap: () =>
                            Navigator.pushNamed(context, CompanyProfileUser.id),
                        width: 150,
                      )
                    : ElevatedBtn(
                        title: 'Requests',
                        onTap: () =>
                            Navigator.pushNamed(context, RequestsWidget.id),
                        width: 150,
                      ),
                const SBW(w: 20),
                !_isComp
                    ? ElevatedBtn(
                        title: 'Apply',
                        onTap: () {},
                        width: 150,
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
