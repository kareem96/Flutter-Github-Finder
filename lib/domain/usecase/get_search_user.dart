


import 'package:dartz/dartz.dart';
import 'package:github_finder/common/errors/failures.dart';
import 'package:github_finder/domain/entities/user.dart';
import 'package:github_finder/domain/repositories/user_repository.dart';


// @injectable
class SearchUser{
  final UserRepository repository;

  SearchUser(this.repository);

  Future<Either<Failure, List<User>>> call(String query){
    return repository.searchUser(query);
  }
}