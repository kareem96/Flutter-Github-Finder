


import 'package:flutter/material.dart';
import 'package:github_finder/domain/entities/user.dart';
import 'package:github_finder/presentation/pages/detail_page.dart';
import 'package:github_finder/presentation/pages/user_detail_page.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade700,
      elevation: 5,
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      child: InkWell(
        /*onTap: (){
          Navigator.pushNamed(
              context,
              DetailRepoPage.route,
              arguments: user.login
          );
        },*/
        onTap: (){
          Navigator.pushNamed(
              context,
              UserDetailPage.route,
              arguments: user.login
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(user.avatar),
          ),
          title: Text(
            user.login,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          subtitle: const Text('Tap to view detail', style: TextStyle(color: Colors.white60),),
        ),
      ),
    );
  }
}
