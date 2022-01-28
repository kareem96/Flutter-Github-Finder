import 'package:equatable/equatable.dart';
import 'package:github_finder/domain/entities/user_detail.dart';


class UserDetailResponse extends Equatable {
  const UserDetailResponse({
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


  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      UserDetailResponse(
        id: json["id"],
        login: json["login"],
        name: json["name"],
        avatar_url: json["avatar_url"] ?? '',
        bio: json["bio"],
        company: json["company"],
        location: json["location"],
        followers: json["followers"],
        following: json["following"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "login": login,
    "name": name,
    "avatar_url": avatar_url,
    "bio": bio,
    "company": company,
    "location": location,
    "followers": followers,
    "following": following,
  };

  UserDetail toEntity() {
    return UserDetail(
        id: id,
        login: login,
        name: name,
        avatar_url: avatar_url,
        bio: bio,
        company: company,
        location: location,
        followers: followers,
        following: following
    );
  }

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
