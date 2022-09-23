import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/service/theme/app_theme.dart';
import 'package:shagher/themes/app_colors.dart';

// class DropDownList extends StatefulWidget {
//   const DropDownList({Key? key, void Function(String)? onChanged})
//       : _onChanged = onChanged,
//         super(key: key);

//   @override
//   State<DropDownList> createState() => _DropDownListState();
//   final void Function(String)? _onChanged;
// }

// class _DropDownListState extends State<DropDownList> {
//   String dropdownValue = 'User';
//   // static bool flag = false;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_drop_down),
//       elevation: 16,
//       style: TextStyle(color: AppColors.primary),
//       isExpanded: true,
//       //isDense: true,
//       underline: Container(
//         height: 2,
//         color: AppColors.primary,
//       ),
//       onChanged: (String? newValue) {
//         widget._onChanged!(newValue!);
//         setState(() {
//           dropdownValue = newValue;
//           // if (dropdownValue == 'Company') flag = true;
//         });
//       },
//       items: <String>['User', 'Company']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(
//             value,
//             //textAlign: TextAlign.center,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
// * TODO Tabs
class ToggleSwitchCompany extends StatefulWidget {
  const ToggleSwitchCompany({Key? key, void Function(int)? onSelected})
      : _onSelected = onSelected,
        super(key: key);

  @override
  State<ToggleSwitchCompany> createState() => _ToggleSwitchCompanyState();
  final void Function(int)? _onSelected;
}

class _ToggleSwitchCompanyState extends State<ToggleSwitchCompany> {
  final List<bool> _isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // ignore: avoid_unnecessary_containers
      width: 320.w,
      height: 40.h,
      child: LayoutBuilder(builder: (context, constraints) {
        return ToggleButtons(
          //color: AppTheme.isDark(context) ? AppColors.bgWhite : AppColors.primary,
          selectedColor: AppColors.white,
          fillColor: AppColors.primary,
          borderColor: AppColors.primary,
          textStyle: AppTheme.h6(context),
          borderRadius: BorderRadius.circular(5.r),
          renderBorder: false,
          constraints: BoxConstraints.expand(width: constraints.maxWidth / 2),
          children: const <Widget>[Text(KeyLang.user), Text(KeyLang.company)],
          onPressed: (int index) {
            widget._onSelected!(index);
            setState(() {
              for (int i = 0; i < _isSelected.length; i++) {
                // if (i == index) {
                //   _isSelected[i] = true;
                // } else {
                //   _isSelected[i] = false;
                // }
                _isSelected[i] = i == index;
              }
            });
          },
          isSelected: _isSelected,
        );
      }),
    );
  }
}
