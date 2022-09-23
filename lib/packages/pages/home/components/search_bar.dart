import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';
import 'package:shagher/packages/pages/Posts/traing/views/paid.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<ModelPost> posts = PaidWidgetState.cards;

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<ModelPost> matchQuery = [];
    for (var post in posts) {
      if (post.requirements!.toLowerCase().contains(query.toLowerCase()) ||
          post.title!.toLowerCase().contains(query.toLowerCase()) ||
          post.rangeSalaryStart! >= int.parse(query) ||
          post.rangeSalaryEnd! <= int.parse(query)) {
        matchQuery.add(post);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return PostCard(data: matchQuery[index]);
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<ModelPost> matchQuery = [];
    for (var post in posts) {
      if (post.requirements!.toLowerCase().contains(query.toLowerCase()) ||
          post.title!.toLowerCase().contains(query.toLowerCase()) ||
          post.rangeSalaryStart! >= int.parse(query) ||
          post.rangeSalaryEnd! <= int.parse(query)) {
        matchQuery.add(post);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return PostCard(data: matchQuery[index]);
      },
    );
  }
}
