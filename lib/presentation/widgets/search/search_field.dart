



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_finder/presentation/bloc/search/search_bloc.dart';
import 'package:github_finder/presentation/provider/search_user_provider.dart';
import 'package:provider/provider.dart';


class SearchField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(

        onSubmitted: (query){
          Provider.of<SearchListNotifier>(context, listen: false).fetchUserSearch(query);
        },
        decoration: const InputDecoration(
            hintText: 'Search user github',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder()
        ),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
