


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_finder/common/state_enum.dart';
import 'package:github_finder/domain/entities/user_detail.dart';
import 'package:github_finder/presentation/provider/user_detail_notifier.dart';
import 'package:provider/provider.dart';

class UserDetailPage extends StatefulWidget {
  static const route = '/user_detail';
  final String username;

  const UserDetailPage({Key? key, required this.username}) : super(key: key);


  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<UserDetailNotifier>(context, listen: false).fetchUserDetail(widget.username);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.username),),
      body: Consumer<UserDetailNotifier>(
        builder: (context, provider, child){
          if(provider.userState == RequestState.Loading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(provider.userState == RequestState.Loaded){
            final user = provider.user;
            return SafeArea(
              child: DetailContent(user,),
            );
          }else{
            return Text(provider.message);
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget{
  final UserDetail user;

  const DetailContent(this.user);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '${user.avatar_url}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )
      ],
    );
  }

}
