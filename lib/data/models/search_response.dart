


import 'package:equatable/equatable.dart';
import 'package:github_finder/data/models/user_model.dart';

class SearchResponse extends Equatable{
  final List<UserModel> userList;

  const SearchResponse({required this.userList});

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
      userList: List<UserModel>.from((json['items'] as List)
          .map((e) => UserModel.fromJson(e))
          .where((element) => element.avatar != null)),
  );
  Map<String, dynamic> toJson() => {
    'items': List<dynamic>.from(userList.map((e) => e.toJson())),
  };


  @override
  // TODO: implement props
  List<Object?> get props => [userList];

}