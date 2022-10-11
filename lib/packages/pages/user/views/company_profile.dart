import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shagher/packages/components/image/cache_user.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/packages/pages/auth/model/company_auth.dart';
import 'package:shagher/packages/pages/home/components/app_bar_home.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/widget/cv_details_widget.dart';
import 'package:shagher/widget/name_widget_company.dart';

class CompanyProfileUser extends StatefulWidget {
  static const id = 'CompanyProfileUser';
  const CompanyProfileUser(
      {Key? key, ModelCompanyAuth? compnay, bool isComp = false})
      : _company = compnay,
        _isComp = isComp,
        super(key: key);

  @override
  _CompanyProfileUserState createState() => _CompanyProfileUserState();
  final ModelCompanyAuth? _company;
  final bool _isComp;
}

class _CompanyProfileUserState extends State<CompanyProfileUser> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  @override
  List items = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];
  final ModelCompanyAuth compnay = ModelCompanyAuth(
    companyName: 'Company Name',
    specialty: 'Cyper Security',
  );
  @override
  void initState() {
    @override
    void initState() {
      items.add(
        Item(
          title: 'title1',
          subtitle: 'subtitle1',
          icon: const Icon(Icons.toc),
        ),
      );
      items.add(
        Item(
          title: 'title2',
          subtitle: 'subtitle2',
          icon: const Icon(Icons.abc),
        ),
      );

      super.initState();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Scaffold(
          appBar: const AppBarHome(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget._isComp
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                                child: const Icon(
                                  Icons.edit,
                                  color: AppColors.grey,
                                ),
                                onTap: () {
                                  //Navigator.pushNamed(context, UserEditProfile.id);
                                }),
                          )
                        : Container(),
                  ],
                ),
                const SBH(h: 40),
                const CachedUser(
                  height: 128,
                  width: 128,
                ),
                const SizedBox(height: 24),
                NameWidgetCompany(company: compnay),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 14),
                const DetailsWidget(
                  title: 'About',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporincididunt ut labore et dolore magna aliqua. ',
                ),
                const SBH(h: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rating',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    //const SBW(w: 20),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemSize: 25,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
                const SBH(h: 24),
                const Divider(),
                const SBH(h: 24),
                const Text(
                  'Reviews',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SBH(h: 24),
                const CustomField(
                  hint: 'Add a review',
                ),
                ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: items[index].leading,
                        title: items[index].title,
                        subtitle: items[index].subtitle,
                      );
                    }),
                // CommentBox(
                //   userImage:
                //       'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                //   child: CommentChild(
                //     data: filedata,
                //   ),
                //   labelText: 'Write a review...',
                //   withBorder: false,
                //   errorText: 'Comment cannot be blank',
                //   sendButtonMethod: () {
                //     if (formKey.currentState!.validate()) {
                //       print(commentController.text);
                //       setState(() {
                //         var value = {
                //           'name': 'user', // user!.displayName,
                //           'pic':
                //               'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                //           'message': commentController.text
                //         };
                //         filedata.insert(0, value);
                //       });
                //       commentController.clear();
                //       FocusScope.of(context).unfocus();
                //     } else {
                //       print("Not validated");
                //     }
                //   },
                //   formKey: formKey,
                //   commentController: commentController,
                //   backgroundColor: AppColors.bgWhite,
                //   textColor: AppColors.black,
                //   sendWidget: Icon(Icons.send_sharp,
                //       size: 30, color: AppColors.primary),
                // ),
                //const Reviews(),
                // BottomSheet(builder: (BuildContext context) {

                //  }, onClosing: () {  },),
                // const SizedBox(height: 88),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  String? title;
  String? subtitle;
  Icon? icon;

  Item({
    this.title,
    this.subtitle,
    this.icon,
  });
}
