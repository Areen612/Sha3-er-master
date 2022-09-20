import 'package:flutter/material.dart';
import 'package:shagher/packages/components/button/sequare_btn.dart';

class StatisticWidget extends StatelessWidget {
  const StatisticWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SequareBtn(
            text: 'Applied',
            value: '7',
          ),
          SizedBox(
            height: 24,
            child: VerticalDivider(),
          ),
          SequareBtn(
            text: 'Reviewed',
            value: '35',
          ),
          SizedBox(
            height: 24,
            child: VerticalDivider(),
          ),
          SequareBtn(
            text: 'Contacted',
            value: '50',
          ),
        ],
      );
}
