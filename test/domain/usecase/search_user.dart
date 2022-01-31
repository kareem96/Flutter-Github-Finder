


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_finder/domain/entities/user.dart';
import 'package:github_finder/domain/usecase/get_search_user.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';



void main(){
  late SearchUser usecase;
  late MockUserRepository mockUserRepository;

  setUp((){
    mockUserRepository = MockUserRepository();
    usecase = SearchUser(mockUserRepository);
  });
  final tUser = <User>[];
  const tQuery = 'kareem96';

  test('should get list of users from the repository', () async{
    //arrange
    when(mockUserRepository.searchUser(tQuery)).thenAnswer((_) async => Right(tUser));
    //act
    final result = await usecase.call(tQuery);
    //assert
    expect(result, Right(tUser));
  });
}