/*



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_finder/presentation/bloc/search/search_bloc.dart';
import 'package:github_finder/presentation/widgets/failur_message.dart';
import 'package:github_finder/presentation/widgets/initial_message.dart';
import 'package:github_finder/presentation/widgets/loading.dart';
import 'package:github_finder/presentation/widgets/search/user_card.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state){
          if(state is SearchInitial){
            return const InitialMessage('Try search user');
          }
          if(state is SearchLoading){
            return const Loading();
          }
          if(state is SearchSuccess){
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.users.length,
              itemBuilder: (context, int index){
                return UserCard(state.users[index]);
              },
            );
          }
          if(state is SearchFailure){
            return const FailureMessage('No user found, try with another username');
          }
          return Container();
        }
    );
  }
}
*/
