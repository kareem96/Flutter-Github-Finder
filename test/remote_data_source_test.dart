

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_finder/common/errors/exceptions.dart';
import 'package:github_finder/data/datasource/remote_data_source.dart';
import 'package:github_finder/data/models/search_response.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'helpers/test_helper.mocks.dart';
import 'json_reader.dart';


void main(){
  const baseUrl = 'https://api.github.com/search/users';

  late RemoteDataSourceImpl datasource;
  late MockHttpClient mockHttpClient;
  setUp((){
    mockHttpClient = MockHttpClient();
    datasource = RemoteDataSourceImpl(client: mockHttpClient);
  });
  
  group('search user', (){
    final toSearchResult = SearchResponse.fromJson(json.decode(readJson('dummy_data/search_user_github.json'))).userList;
    const tQuery = 'kareem96';

    test('should return list of user when response is 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl?q=$tQuery'))).thenAnswer((_) async => http.Response(
        readJson('dummy_data/search_user_github.json'), 200));
      //act
      final  result = await datasource.searchUser(tQuery);
      //assert
      expect(result, toSearchResult);
    });

    test('should throw ServerException when response code is other than 200', () async {
      //arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl?q=$tQuery'))).thenAnswer((_) async => http.Response('Server Error', 404));
      //act
      final  call = datasource.searchUser(tQuery);
      //assert
      expect(call, throwsA(isA<ServerException>()));
    });
  });
}