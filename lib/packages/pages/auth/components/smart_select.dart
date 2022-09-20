import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:shagher/language/generated/key_lang.dart';

class SmartSelector extends StatefulWidget {
  const SmartSelector({Key? key}) : super(key: key);

  @override
  State<SmartSelector> createState() => _SmartSelectState();
}

class _SmartSelectState extends State<SmartSelector> {
  List<int> value = [100];
  final List<S2Choice<int>>? _choiceItems = [
    S2Choice<int>(value: 1, title: 'Ionic'),
    S2Choice<int>(value: 2, title: 'Flutter'),
    S2Choice<int>(value: 3, title: 'React Native'),
  ];
  List<int> selectedValue = const [];

  @override
  Widget build(BuildContext context) {
    return SmartSelect<int>.multiple(
      title: KeyLang.skills.tr(),
      placeholder: 'Select one or more',
      selectedValue: value,
      choiceItems: _choiceItems,
      selectedChoice: const [],
      modalConfig: const S2ModalConfig(
        type: S2ModalType.popupDialog,
        useFilter: true,
        filterAuto: true,
        useConfirm: true,
      ),
      choiceType: S2ChoiceType.chips,
      groupEnabled: true,
      groupConfig: const S2GroupConfig(
        enabled: true,
      ),
      groupSortBy: S2GroupSort.byNameInDesc(),
      onChange: (state) => setState(() => value = state.value),
    );
  }
}
