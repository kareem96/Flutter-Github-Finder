


import 'package:flutter/material.dart';
import 'package:github_finder/common/state_enum.dart';
import 'package:github_finder/domain/entities/user_detail.dart';
import 'package:github_finder/domain/usecase/get_user_detail.dart';

class UserDetailNotifier extends ChangeNotifier{
  final GetUserDetail getUserDetail;

  UserDetailNotifier({required this.getUserDetail});

  late UserDetail _user;
  UserDetail get user => _user;

  RequestState _userState = RequestState.Empty;
  RequestState get userState => _userState;

  String _message = '';
  String get message => _message;

  Future<void> fetchUserDetail(String username) async{
    _userState =RequestState.Loading;
    notifyListeners();
    final detailResult = await getUserDetail.execute(username);
    detailResult.fold(
            (failure) {
              _userState = RequestState.Error;
              _message = failure.message;
              notifyListeners();
            },
            (user) {
              _user = user;
              _userState = RequestState.Loaded;
              notifyListeners();
            });
  }
}