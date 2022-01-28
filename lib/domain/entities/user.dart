

import 'package:equatable/equatable.dart';

/*
class User extends Equatable{
  final int id;
  final String login;
  final String avatar;

  const User({required this.id, required this.login, required this.avatar});

  @override
  // TODO: implement props
  List<Object?> get props => [id, login, avatar];


}*/


class User extends Equatable{
  int id;
  String login;
  String avatar;

  User({
    required this.id,
    required this.login,
    required this.avatar
  });

  @override
  List<Object?> get props => [id, login, avatar];


}