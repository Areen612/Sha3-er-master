import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/components/button/elevated_btn.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';
import 'package:shagher/service/theme/app_theme.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/util/api_key.dart';

// TODO Refactor
class AddPostWidget extends StatefulWidget {
  static const String id = "AddPostWidget";
  final dynamic docment;
  const AddPostWidget({Key? key, this.docment}) : super(key: key);

  @override
  State<AddPostWidget> createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  final _keyForm = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;
  RangeValues _currentRangeValues = const RangeValues(250, 500);
  final ModelPost _modelPost = ModelPost();

  int? _value = 0;
  int? _valueTraining = 0;
  bool _flag = false;

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerRequirements = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();

  // Map<String, dynamic> routeData;
  @override
  void initState() {
    super.initState();

    if (widget.docment != null) {
      _controllerTitle.text = widget.docment[KeyApi.title];
      _controllerRequirements.text = widget.docment[KeyApi.requirements];
      _controllerDescription.text = widget.docment[KeyApi.description];
      _value = widget.docment[KeyApi.type];
      _valueTraining = widget.docment[KeyApi.subType];
      // ! fix this
      _currentRangeValues = widget.docment[KeyApi.rangeSalary];
    }
    _modelPost.id = user!.uid;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(microseconds: 10), () {
  //     routeData =
  //         ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  //   }).then((_) => routeData == null
  //       ? Future.delayed(Duration.zero, () {
  //           clearData();
  //           final postProvider =
  //               Provider.of<PostProvider>(context, listen: false);
  //           postProvider.loadValues(ModelPost());
  //         })
  //       : Future.delayed(Duration.zero, () {
  //           // print(routeData);
  //           // nameController.text = routeData['productName'];
  //           // priceController.text = routeData['productPrice'].toString();

  //           final postProvider =
  //               Provider.of<PostProvider>(context, listen: false);
  //           ModelPost post = ModelPost(
  //               // productId: routeData['productId'],
  //               // price: routeData['productPrice'],
  //               // productName: routeData['productName'],
  //               );
  //           postProvider.loadValues(post);
  //         }));
  // }

  _handleSubmitAction() async {
    if (_keyForm.currentState!.validate()) {
      if (widget.docment != null) {
        await FirebaseFirestore.instance
            .collection("posts")
            .doc(widget.docment.id)
            .update(_modelPost.toMap()
                //       {
                //   KeyApi.title: _modelPost.title,
                //   KeyApi.requirements: _modelPost.requirements,
                //   KeyApi.description: _modelPost.description,
                //   KeyApi.type: _modelPost.type,
                //   KeyApi.subType: _modelPost.subType,
                //   KeyApi.rangeSalary: _modelPost.rangeSalary,
                // }

                );
      } else {
        await FirebaseFirestore.instance
            .collection("posts")
            .add(_modelPost.toMap()
                //   {
                //   KeyApi.title: _modelPost.title,
                //   KeyApi.requirements: _modelPost.requirements,
                //   KeyApi.description: _modelPost.description,
                //   KeyApi.type: _modelPost.type,
                //   KeyApi.subType: _modelPost.subType,
                //   KeyApi.rangeSalary: _modelPost.rangeSalary,
                // }

                );
      }
      Navigator.pop(context);
    }
  }

  // TODO: build the delete icon
  // _handleSoftDelete() async {
  //   await FirebaseFirestore.instance
  //       .collection("posts")
  //       .doc(widget.docment.id)
  //       .update({"status": 1});

  //   Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    List _choices = [
      Text(KeyLang.job.tr()),
      // Text('    ' + KeyLang.job.tr() + '    '),
      Text(KeyLang.training.tr())
    ];
    List _choicesTraining = [
      Text(KeyLang.paid.tr()),
      Text(KeyLang.unpaid.tr())
    ];
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: true,
        appBar: AppBar(),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Expanded(
                child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create new post',
                      style: AppTheme.h5(context)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SBH(h: 60),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Title',
                      style: AppTheme.h6(context)
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SBH(h: 10),
                  CustomField(
                    onValidator: AppValidators.isEmpty,
                    controller: _controllerTitle,
                    onSaved: _modelPost.setTitle,
                  ),
                  const SBH(h: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Requirements',
                      style: AppTheme.h6(context)
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SBH(h: 10),
                  CustomField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 50,
                    onValidator: AppValidators.isEmpty,
                    controller: _controllerRequirements,
                    onSaved: _modelPost.setRequirements,
                    // contentPadding: EdgeInsets.all(12),

                    // onSaved: ,
                  ),
                  const SBH(h: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description',
                      style: AppTheme.h6(context)
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SBH(h: 10),
                  CustomField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 50,
                    onValidator: AppValidators.isEmpty,
                    controller: _controllerDescription,
                    onSaved: _modelPost.setDescription,
                    // contentPadding: EdgeInsets.all(12),

                    // onSaved: ,
                  ),
                  const SBH(h: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Type',
                      style: AppTheme.h6(context)
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SBH(h: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      children: List<Widget>.generate(
                        2,
                        (int index) {
                          // TODO: trace
                          return ChoiceChip(
                            label: _choices[index],
                            selected: _value == index,
                            selectedColor: AppColors.primary,
                            padding: const EdgeInsets.all(10),
                            onSelected: (bool selected) {
                              setState(() {
                                // TODO  value
                                _value = selected ? index : null;
                                index == 0
                                    ? _modelPost.setType('Job')
                                    : _modelPost.setType('Training');
                                index == 1 ? _flag = true : _flag = false;
                              });
                            },
                          );
                        },
                      ).toList(),
                      spacing: 10,
                    ),
                  ),
                  Visibility(
                    visible: _flag,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        children: List<Widget>.generate(
                          2,
                          (int index) {
                            return ChoiceChip(
                              label: _choicesTraining[index],
                              selected: _valueTraining == index,
                              selectedColor: AppColors.primary,
                              //padding: const EdgeInsets.all(10),
                              onSelected: (bool selected) {
                                setState(() {
                                  _valueTraining = selected ? index : null;
                                  index == 0
                                      ? _modelPost.setSubType('paid')
                                      : _modelPost.setSubType('unpaid');
                                });
                              },
                            );
                          },
                        ).toList(),
                        spacing: 10,
                      ),
                    ),
                  ),
                  const SBH(h: 60),
                  Text(
                    'Range Salary',
                    style: AppTheme.h6(context)
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SBH(h: 10),
                  RangeSlider(
                    values: _currentRangeValues,
                    min: 100,
                    max: 1050,
                    divisions: 5,
                    activeColor: AppColors.primary,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                        _modelPost.setRangeSalary(
                            values.start.round().toString() +
                                ' - ' +
                                values.end.round().toString());
                        _modelPost.setRangeSalaryStart(values.start);
                        _modelPost.setRangeSalaryEnd(values.end);
                      });
                    },
                  ),
                  const SBH(h: 60),
                  ElevatedBtn(
                    title: 'Post',
                    onTap: _handleSubmitAction,
                  ),
                  const SBH(h: 60)
                ],
              ),
            )),
          ),
        ),
      ),
    );
    //);
  }
}

// Row(
//   children: [
//     Text(
//       'Requirements',
//       style: AppTheme.h6(context)
//           .copyWith(fontWeight: FontWeight.w500),
//     ),
//     const SBW(w: 10),
//     const Expanded(
//         child: CustomField(
//       keyboardType: TextInputType.multiline,
//       maxLines: 10,
//     )),
//   ],
// ),
