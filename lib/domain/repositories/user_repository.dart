


import 'package:dartz/dartz.dart';
import 'package:github_finder/common/errors/failures.dart';
import 'package:github_finder/domain/entities/user.dart';
import 'package:github_finder/domain/entities/user_detail.dart';
import 'package:github_finder/domain/entities/user_repo.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> searchUser(String query);
  Future<Either<Failure, List<Repo>>> loadRepo(String username);
  Future<Either<Failure, UserDetail>> loadDetail(String username);
}