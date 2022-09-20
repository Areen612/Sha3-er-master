import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shagher/packages/components/image/cache_user.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/pages/auth/model/company_auth.dart';
import 'package:shagher/packages/pages/home/components/app_bar_home.dart';
import 'package:shagher/service/theme/app_theme.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/widget/cv_details_widget.dart';
import 'package:shagher/widget/name_widget_company.dart';

class CompanyProfileUser extends StatefulWidget {
  static const id = 'CompanyProfileUser';
  const CompanyProfileUser({Key? key, ModelCompanyAuth? compnay})
      : _company = compnay,
        super(key: key);

  @override
  _CompanyProfileUserState createState() => _CompanyProfileUserState();
  final ModelCompanyAuth? _company;
}

class _CompanyProfileUserState extends State<CompanyProfileUser> {
  final ModelCompanyAuth compnay = ModelCompanyAuth(
    companyName: 'Company Name',
    specialty: 'Cyper Security',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Scaffold(
          appBar: const AppBarHome(),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.grey,
                        ),
                        onTap: () {
                          //Navigator.pushNamed(context, UserEditProfile.id);
                        }),
                  ),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Rating',
                    style: AppTheme.h5(context),
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
              const Divider(),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 48),
              const SizedBox(height: 48),
              const SizedBox(height: 88),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 48),
              //   child: ElevatedBtn(
              //     // TODO: tr()
              //     title: 'CV',
              //     onTap: () {},
              //     width: 300,
              //   ),
              // ),
              const SizedBox(height: 88),
            ],
          ),
        ),
      ),
    );
  }
}
