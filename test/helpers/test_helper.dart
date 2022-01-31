

import 'package:github_finder/data/datasource/remote_data_source.dart';
import 'package:github_finder/domain/repositories/user_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([
  RemoteDataSource,
  UserRepository,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main(){}