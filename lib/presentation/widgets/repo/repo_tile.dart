


import 'package:flutter/material.dart';
import 'package:github_finder/domain/entities/user_repo.dart';

class RepoTile extends StatelessWidget {
  final Repo repo;
  const RepoTile(this.repo,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(20),
      title: Text(repo.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Text(repo.description),
        ],
      ),
    );
  }
}
