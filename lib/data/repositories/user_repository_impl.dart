



import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:github_finder/common/errors/exceptions.dart';
import 'package:github_finder/common/errors/failures.dart';
import 'package:github_finder/data/datasource/remote_data_source.dart';
import 'package:github_finder/domain/entities/user.dart';
import 'package:github_finder/domain/entities/user_detail.dart';
import 'package:github_finder/domain/entities/user_repo.dart';
import 'package:github_finder/domain/repositories/user_repository.dart';


class UserRepositoryImpl implements UserRepository{
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<User>>> searchUser(String query)async {
    // TODO: implement searchUser
    try{
      final result = await remoteDataSource.searchUser(query);
      return Right(result.map((model) => model.toEntity()).toList());
    }on ServerException{
      return Left(ServerFailure());
    }on SocketException{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Repo>>> loadRepo(String username) async {
    // TODO: implement loadRepo
    try{
      final result = await remoteDataSource.loadRepo(username);
      return Right(result.map((e) => e.toEntity()).toList());
    }on ServerException{
    return Left(ServerFailure());
    }on SocketException{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserDetail>> loadDetail(String username) async{
    // TODO: implement loadDetail
    try{
      final result = await remoteDataSource.loadDetail(username);
      return Right(result.toEntity());
    }on ServerException{
      return Left(ServerFailure());
    }on SocketException{
      return Left(ConnectionFailure());
    }
  }


}