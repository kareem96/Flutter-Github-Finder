


import 'package:dartz/dartz.dart';
import 'package:github_finder/common/errors/failures.dart';
import 'package:github_finder/domain/entities/user_detail.dart';
import 'package:github_finder/domain/repositories/user_repository.dart';

class GetUserDetail{
  final UserRepository repository;

  GetUserDetail(this.repository);

  Future<Either<Failure, UserDetail>> execute(String username){
    return repository.loadDetail(username);
  }
}