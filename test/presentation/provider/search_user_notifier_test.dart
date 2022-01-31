



import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_finder/common/errors/failures.dart';
import 'package:github_finder/common/state_enum.dart';
import 'package:github_finder/domain/entities/user.dart';
import 'package:github_finder/domain/usecase/get_search_user.dart';
import 'package:github_finder/presentation/provider/search_user_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'search_user_notifier_test.mocks.dart';

@GenerateMocks([SearchUser])
void main(){
  late SearchListNotifier provider;
  late MockSearchUser mockSearchUser;
  late int listenerCallCount;

  setUp((){
    listenerCallCount = 0;
    mockSearchUser = MockSearchUser();
    provider = SearchListNotifier(searchUser: mockSearchUser)
    ..addListener(() { listenerCallCount += 1;});
  });

  final tUserModel = User(
      id: 23423991,
      login: 'login',
      avatar: 'avatar_url'
  );
  final tUserList = <User>[tUserModel];
  final tQuery = 'kareem96';

  group('search user', (){
    test('should change state to loading when usecase is called', () async{
      //arrange
      when(mockSearchUser.call(tQuery)).thenAnswer((_) async => Right(tUserList));
      //act
      provider.fetchUserSearch(tQuery);
      //assert
      expect(provider.state, RequestState.Loading);
    });

    test('should chnage search result data when data is gotten successfully', () async{
      //arrange
      when(mockSearchUser.call(tQuery)).thenAnswer((_) async => Right(tUserList));
      //act
      await provider.fetchUserSearch(tQuery);
      //assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchResult, tUserList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async{
      //arrange
      when(mockSearchUser.call(tQuery)).thenAnswer((_) async  => Left(ServerFailure()));
      //act
       await provider.fetchUserSearch(tQuery);
       //assert
       expect(provider.state, RequestState.Error);
       expect(provider.message, 'Server Failure');
       expect(listenerCallCount, 2);
    });
  });
}
