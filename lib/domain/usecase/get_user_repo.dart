



import 'package:dartz/dartz.dart';
import 'package:github_finder/common/errors/failures.dart';
import 'package:github_finder/domain/entities/user_repo.dart';
import 'package:github_finder/domain/repositories/user_repository.dart';

class LoadRepoUser{
  final UserRepository repository;

  LoadRepoUser(this.repository);

  Future<Either<Failure, List<Repo>>> call(String username){
    return repository.loadRepo(username);
  }
}