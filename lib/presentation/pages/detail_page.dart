


import 'package:flutter/material.dart';
import 'package:github_finder/common/state_enum.dart';
import 'package:github_finder/presentation/provider/load_repo_provider.dart';
import 'package:github_finder/presentation/widgets/repo/repo_tile.dart';
import 'package:provider/provider.dart';

class DetailRepoPage extends StatefulWidget {
  static const route = '/detail';
  final String user;
  const DetailRepoPage({Key? key, required this.user,}) : super(key: key);

  @override
  _DetailRepoPageState createState() => _DetailRepoPageState();
}

class _DetailRepoPageState extends State<DetailRepoPage> {

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<LoadRepoNotifier>(context, listen: false).fetchUserRepo(widget.user);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.toString()),

      ),
      body: Consumer<LoadRepoNotifier>(
          builder: (context, data, child){
            if(data.state == RequestState.Loading){
              return const Center(child: CircularProgressIndicator(),);
            }else if(data.state == RequestState.Loaded){
              final result = data.repoResult;
              return ListView.separated(
                itemCount: result.length,
                separatorBuilder: (context, int index){
                  return Divider(indent: 10, endIndent: 10,);
                },
                itemBuilder: (context, int index){
                  return RepoTile(data.repoResult[index]);
                },
              );
            }else if(data.state == RequestState.Error){
              return Container(child:  Text('${data.message}'),);
            }
            return Container();
          }
      )
    );
  }
}
