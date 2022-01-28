


import 'package:flutter/material.dart';
import 'package:github_finder/common/state_enum.dart';
import 'package:github_finder/domain/entities/user.dart';
import 'package:github_finder/domain/usecase/get_search_user.dart';

class SearchListNotifier extends ChangeNotifier{
  final SearchUser searchUser;

  SearchListNotifier({required this.searchUser});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<User> _searchResult = [];
  List<User> get searchResult => _searchResult;
  String _message = '';
  String get message => _message;

  Future<void> fetchUserSearch(String query) async{
    _state = RequestState.Loading;
    notifyListeners();
    final result = await searchUser.call(query);
    result.fold(
        (failure){
          _message = failure.message;
          _state = RequestState.Error;
          notifyListeners();
        },
        (data){
          _searchResult = data;
          _state = RequestState.Loaded;
          notifyListeners();
        }
    );
  }
}