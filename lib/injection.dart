

import 'package:get_it/get_it.dart';
import 'package:github_finder/data/datasource/remote_data_source.dart';
import 'package:github_finder/data/repositories/user_repository_impl.dart';
import 'package:github_finder/domain/repositories/user_repository.dart';
import 'package:github_finder/domain/usecase/get_search_user.dart';
import 'package:github_finder/domain/usecase/get_user_detail.dart';
import 'package:github_finder/domain/usecase/get_user_repo.dart';
import 'package:github_finder/presentation/provider/load_repo_provider.dart';
import 'package:github_finder/presentation/provider/search_user_provider.dart';
import 'package:github_finder/presentation/provider/user_detail_notifier.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init(){

  ///provider
  locator.registerFactory(() => SearchListNotifier(searchUser: locator()));
  locator.registerFactory(() => LoadRepoNotifier(loadRepoUser: locator()));
  locator.registerFactory(() => UserDetailNotifier(getUserDetail: locator()));

  ///use case
  locator.registerLazySingleton(() => SearchUser(locator()));
  locator.registerLazySingleton(() => LoadRepoUser(locator()));
  locator.registerLazySingleton(() => GetUserDetail(locator()));

  ///repository
  locator.registerLazySingleton<UserRepository>(
          () => UserRepositoryImpl(remoteDataSource: locator()));

  ///data source
  locator.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(client: locator()));

  ///external
  locator.registerLazySingleton(() => http.Client());
}