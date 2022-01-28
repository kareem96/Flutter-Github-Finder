/*




import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:http/http.dart' as http;

import 'package:github_finder/data/datasource/remote_data_source.dart' as _i4;
import 'package:github_finder/data/repositories/user_repository_impl.dart' as _i7;
import 'package:github_finder/common/network/network_info.dart' as _i5;
import 'package:github_finder/domain/repositories/user_repository.dart' as _i6;
import 'package:github_finder/domain/usecase/get_search_user.dart' as _i8;
import 'package:github_finder/presentation/bloc/search/search_bloc.dart' as _i9;
import 'third_party_module.dart' as _i12;

_i1.GetIt $initGetIt(_i1.GetIt get, {String? environment, _i2.EnvironmentFilter? environmentFilter}){
  final getHelper = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyModule = _$ThirdPartyModule();

  getHelper.lazySingleton<http.Client>(() => thirdPartyModule.client);
  getHelper.lazySingleton<_i4.RemoteDataSource>(() => _i4.RemoteDataSource(get<http.Client>()));
  getHelper.lazySingleton<_i5.INetworkInfo>(() => _i5.NetworkInfo());
  getHelper.lazySingleton<_i6.IUserRepository>(() => _i7.UserRepositoryImpl(get<_i4.IRemoteDataSource>(), get<_i5.INetworkInfo>()));

  getHelper.factory<_i8.SearchUser>(() => _i8.SearchUser(get<_i6.IUserRepository>()));
  getHelper.factory<_i9.SearchBloc>(() => _i9.SearchBloc(get<_i8.SearchUser>()));
  return get;
}

class _$ThirdPartyModule extends _i12.ThirdPartyModule{}*/
