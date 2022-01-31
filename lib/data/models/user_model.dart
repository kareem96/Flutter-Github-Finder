


import 'package:equatable/equatable.dart';
import 'package:github_finder/domain/entities/user.dart';

class UserModel extends Equatable{
  final int id;
  final String login;
  final String avatar;
  const UserModel({
    required this.id,
    required this.login,
    required this.avatar
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] ,
    login: json['login'] ,
    avatar: json['avatar_url'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'login': login,
    'avatar_url': avatar,
  };

  User toEntity(){
    return User(
        id: id,
        login: login,
        avatar: avatar
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    login,
    avatar,
  ];
}