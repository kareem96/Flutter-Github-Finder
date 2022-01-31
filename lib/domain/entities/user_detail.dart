

import 'package:equatable/equatable.dart';

class UserDetail extends Equatable {
  const UserDetail({
    required this.id,
    required this.login,
    required this.name,
    required this.avatar_url,
    required this.bio,
    required this.company,
    required this.location,
    required this.followers,
    required this.following,
  });

  final int id;
  final String? login;
  final String? name;
  final String? avatar_url;
  final String? bio;
  final String? company;
  final String? location;
  final int followers;
  final int following;


  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    login,
    name,
    avatar_url,
    bio,
    company,
    location,
    following,
    followers,
  ];

}
