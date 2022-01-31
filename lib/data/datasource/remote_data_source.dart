

import 'dart:convert';

import 'package:github_finder/common/errors/exceptions.dart';
import 'package:github_finder/data/models/repo_model.dart';
import 'package:github_finder/data/models/search_response.dart';
import 'package:github_finder/data/models/user_detail_model.dart';
import 'package:github_finder/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource{
  Future<List<UserModel>> searchUser(String query);
  Future<List<RepoModel>> loadRepo(String username);
  Future<UserDetailResponse> loadDetail(String username);
}


class RemoteDataSourceImpl implements RemoteDataSource{
  static const baseUrl = 'https://api.github.com/search/users';
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> searchUser(String query)async {
    final response = await client.get(Uri.parse('$baseUrl?q=$query'));
    if(response.statusCode == 200){
      print(response.body);
      return SearchResponse.fromJson(json.decode(response.body)).userList;
      /*final List<dynamic> userList = jsonDecode(response.body)['items'];
      return userList.map((x) => UserModel.fromJson(x)).toList();*/
    }else{
      throw ServerException();
    }
  }

  @override
  Future<List<RepoModel>> loadRepo(String username) async{
    // TODO: implement loadRepo
    final response = await client.get(Uri.parse('https://api.github.com/users/$username/repos'));
    // print(loadRepo(username));
    if(response.statusCode == 200){
      print(response.body);
      final List<dynamic> repoList = jsonDecode(response.body);
      return repoList.map((json) => RepoModel.fromJson(json)).toList();
    }else{
      throw ServerException();
    }
  }

  @override
  Future<UserDetailResponse> loadDetail(String username) async{
    final response = await client.get(Uri.parse('https://api.github.com/users/$username'));
    if(response.statusCode == 200){

      return UserDetailResponse.fromJson(json.decode(response.body));
    }else{
      print(response.body);
      throw ServerException();

    }
  }
}