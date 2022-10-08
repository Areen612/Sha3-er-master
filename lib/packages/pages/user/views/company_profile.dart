import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shagher/packages/components/image/cache_user.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/pages/auth/model/company_auth.dart';
import 'package:shagher/packages/pages/home/components/app_bar_home.dart';
import 'package:shagher/packages/pages/user/components/reviews_section.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/widget/details_widget.dart';
import 'package:shagher/widget/name_widget_company.dart';

class CompanyProfileUser extends StatefulWidget {
  static const id = 'CompanyProfileUser';

  final String? compnayID;
  const CompanyProfileUser(
      {Key? key,
      ModelCompanyAuth? compnay,
      bool isComp = false,
      this.compnayID})
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
  final TextEditingController _commentController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool showComment = false;
  final bool _isCommenting = false;
  String? name;
  String? imageUrl;

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
                const SBH(h: 24),
                NameWidgetCompany(company: compnay),
                const SBH(h: 24),
                const Divider(),
                const SBH(h: 14),
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
                const SBH(h: 5),
                //* ******************************************************************  *//
                Reviews(
                  compnayID: widget.compnayID,
                )
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
