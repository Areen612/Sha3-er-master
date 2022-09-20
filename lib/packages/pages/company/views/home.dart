import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';

class CompanyHomeWidget extends StatefulWidget {
  const CompanyHomeWidget({Key? key}) : super(key: key);

  @override
  State<CompanyHomeWidget> createState() => _CompanyHomeWidgetState();
}

class _CompanyHomeWidgetState extends State<CompanyHomeWidget> {
  @override
  List<ModelPost> cards = [];

  @override
  void initState() {
    super.initState();
    cards.add(ModelPost(
        id: 0,
        title: 'Company 1',
        requirements: 'flutter developer',
        rangeSalary: '400-600',
        type: 'paid'));
    cards.add(ModelPost(
        id: 7,
        title: 'Company 2',
        requirements: 'database adiminstaror',
        rangeSalary: '500-600',
        type: 'paid'));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return PostCard(
          data: cards[index],
          isComp: true,
        );
      },
    );
  }
}
