


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
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return  Stack(
      children: <Widget>[
         CachedNetworkImage(
            imageUrl: '${user.avatar_url}',
            width: _width,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
         Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.center,
                      child:  Padding(
                        padding:  EdgeInsets.only(top: 270),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: _height / 2.2),
                      child:  Container(
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(
                          top: _height / 2.6,
                          left: _width / 20,
                          right: _width / 20),
                      child:  Column(
                        children: <Widget>[
                          Container(
                            decoration:  const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 2.0,
                                      offset:  Offset(0.0, 2.0))
                                ]),
                            child:  Padding(
                              padding: EdgeInsets.all(_width / 20),
                              child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    headerChild('Repository', user.followers),
                                    headerChild('Followers', user.followers),
                                    headerChild('Following', user.following),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          )
        ),
      ],
    );
  }

  Widget headerChild(String header, int value) =>  Expanded(
      child:  Column(
        children: <Widget>[
           Text(header),
           const SizedBox(height: 8.0,),
           Text('$value',
            style:  const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF26CBE6),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) =>  Padding(
    padding:  const EdgeInsets.only(bottom: 8.0),
    child:  InkWell(
      child:  Row(
        children: <Widget>[
           const SizedBox(width: 10,),
           Icon(
            icon,
            color: const Color(0xFF26CBE6),
            // size: 36.0,
          ),
           SizedBox(
            width: width / 20,
          ),
           Text(data)
        ],
      ),
      onTap: () {
        print('Info Object selected');
      },
    ),
  );

}
