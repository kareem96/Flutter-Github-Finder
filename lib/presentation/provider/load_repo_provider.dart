


import 'package:flutter/cupertino.dart';
import 'package:github_finder/common/state_enum.dart';
import 'package:github_finder/domain/entities/user_repo.dart';
import 'package:github_finder/domain/usecase/get_user_repo.dart';

class LoadRepoNotifier extends ChangeNotifier{
  final LoadRepoUser loadRepoUser;

  LoadRepoNotifier({required this.loadRepoUser});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Repo> _repoResult = [];
  List<Repo> get repoResult => _repoResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchUserRepo(String username) async{
    _state = RequestState.Loading;
    notifyListeners();
    final result = await loadRepoUser.call(username);
    result.fold(
            (failure) {
              _message = failure.message;
              _state = RequestState.Error;
              notifyListeners();
              },
            (data) {
              _repoResult = data;
              _state = RequestState.Loaded;
              notifyListeners();
            }
            );
  }
}