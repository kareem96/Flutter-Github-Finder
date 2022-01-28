


import 'package:flutter/material.dart';
import 'package:github_finder/common/state_enum.dart';
import 'package:github_finder/presentation/provider/search_user_provider.dart';
import 'package:provider/provider.dart';

class ResultText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Consumer<SearchListNotifier>(
          builder: (context, data, child){
            if(data.state == RequestState.Loaded){
              final result = data.searchResult.length == 1 ? 'user found' : 'users found';
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('${data.searchResult.length} $result',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 14),
                ),
              );
            }
            return Container();
          }
      );
  }

  /*@override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state){
          if(state is SearchSuccess){
            final text = state.users.length == 1 ? 'user found' : 'user found';
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('${state.users.length} $text',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                      fontSize: 12
                  ),
                )
            );
          }
          return Container();
        }
    );
  }*/
}
