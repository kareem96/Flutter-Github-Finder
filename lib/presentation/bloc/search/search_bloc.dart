/*



import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_finder/domain/entities/user.dart';
import 'package:github_finder/domain/usecase/get_search_user.dart';
// import 'package:injectable/injectable.dart';

part 'search_event.dart';
part 'search_state.dart';

// @injectable
class SearchBloc extends Bloc<SearchEvent, SearchState>{
  final SearchUser _search;
  SearchBloc(this._search) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async*{
    // TODO: implement mapEventToState
    if(event is SearchUserStarted){
      yield SearchLoading();
      final result = await _search(event.query);
      yield* result.fold(
          (failure) async*{
            yield SearchFailure();
          },
          (users) async*{
            yield SearchSuccess(users);
          }
      );
    }
  }

}*/
