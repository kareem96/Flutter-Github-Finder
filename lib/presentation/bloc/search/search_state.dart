/*



part of 'search_bloc.dart';


abstract class SearchState extends Equatable{
  const SearchState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchInitial extends SearchState{}
class SearchLoading extends SearchState{}
class SearchSuccess extends SearchState{
  final List<User> users;

  const SearchSuccess(this.users);
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class SearchFailure extends SearchState{}*/
