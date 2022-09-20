import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/components/button/elevated_btn.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/theme/app_theme.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/themes/app_colors.dart';

// TODO Refactor
class AddPostWidget extends StatefulWidget {
  static const String id = "AddPostWidget";
  const AddPostWidget({Key? key}) : super(key: key);

  @override
  State<AddPostWidget> createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  RangeValues _currentRangeValues = const RangeValues(250, 500);

  int? _value = 0;
  int? _valueTraining = 0;
  bool _flag = false;
  @override
  void initState() {
    super.initState();
  }

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
                const CustomField(
                  onValidator: AppValidators.isEmpty,
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
                const CustomField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 50,
                  onValidator: AppValidators.isEmpty,
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
                const CustomField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 50,
                  onValidator: AppValidators.isEmpty,
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
                        return ChoiceChip(
                          label: _choices[index],
                          selected: _value == index,
                          selectedColor: AppColors.primary,
                          padding: const EdgeInsets.all(10),
                          onSelected: (bool selected) {
                            setState(() {
                              // TODO  value
                              _value = selected ? index : null;
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
                    });
                  },
                ),
                const SBH(h: 60),
                ElevatedBtn(
                  title: 'Post',
                  onTap: () {},
                ),
                const SBH(h: 60)
              ],
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
