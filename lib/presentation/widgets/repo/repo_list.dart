


import 'package:flutter/material.dart';
import 'package:github_finder/common/state_enum.dart';
import 'package:github_finder/presentation/provider/load_repo_provider.dart';
import 'package:github_finder/presentation/widgets/repo/repo_tile.dart';
import 'package:provider/provider.dart';

class RepoList extends StatelessWidget {
  const RepoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Consumer<LoadRepoNotifier>(
        builder: (context, data, child){
          if(data.state == RequestState.Loading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(data.state == RequestState.Loaded){
            // final result = data.loadRepoUser;
            return ListView.separated(
                itemCount: data.repoResult.length,
                separatorBuilder: (context, int index){
                    return Divider(indent: 10, endIndent: 10,);
                  },
                itemBuilder: (context, int index){
                  return RepoTile(data.repoResult[index]);
                },
            );
          }else{
            return Container();
          }
        }
    );
  }
}
