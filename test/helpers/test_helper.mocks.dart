// Mocks generated by Mockito 5.0.17 from annotations
// in github_finder/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i14;
import 'dart:typed_data' as _i15;

import 'package:dartz/dartz.dart' as _i3;
import 'package:github_finder/common/errors/failures.dart' as _i10;
import 'package:github_finder/data/datasource/remote_data_source.dart' as _i5;
import 'package:github_finder/data/models/repo_model.dart' as _i8;
import 'package:github_finder/data/models/user_detail_model.dart' as _i2;
import 'package:github_finder/data/models/user_model.dart' as _i7;
import 'package:github_finder/domain/entities/user.dart' as _i11;
import 'package:github_finder/domain/entities/user_detail.dart' as _i13;
import 'package:github_finder/domain/entities/user_repo.dart' as _i12;
import 'package:github_finder/domain/repositories/user_repository.dart' as _i9;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUserDetailResponse_0 extends _i1.Fake
    implements _i2.UserDetailResponse {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i5.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i7.UserModel>> searchUser(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchUser, [query]),
              returnValue: Future<List<_i7.UserModel>>.value(<_i7.UserModel>[]))
          as _i6.Future<List<_i7.UserModel>>);
  @override
  _i6.Future<List<_i8.RepoModel>> loadRepo(String? username) =>
      (super.noSuchMethod(Invocation.method(#loadRepo, [username]),
              returnValue: Future<List<_i8.RepoModel>>.value(<_i8.RepoModel>[]))
          as _i6.Future<List<_i8.RepoModel>>);
  @override
  _i6.Future<_i2.UserDetailResponse> loadDetail(String? username) =>
      (super.noSuchMethod(Invocation.method(#loadDetail, [username]),
              returnValue: Future<_i2.UserDetailResponse>.value(
                  _FakeUserDetailResponse_0()))
          as _i6.Future<_i2.UserDetailResponse>);
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i9.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.Either<_i10.Failure, List<_i11.User>>> searchUser(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchUser, [query]),
          returnValue: Future<_i3.Either<_i10.Failure, List<_i11.User>>>.value(
              _FakeEither_1<_i10.Failure, List<_i11.User>>())) as _i6
          .Future<_i3.Either<_i10.Failure, List<_i11.User>>>);
  @override
  _i6.Future<_i3.Either<_i10.Failure, List<_i12.Repo>>> loadRepo(
          String? username) =>
      (super.noSuchMethod(Invocation.method(#loadRepo, [username]),
          returnValue: Future<_i3.Either<_i10.Failure, List<_i12.Repo>>>.value(
              _FakeEither_1<_i10.Failure, List<_i12.Repo>>())) as _i6
          .Future<_i3.Either<_i10.Failure, List<_i12.Repo>>>);
  @override
  _i6.Future<_i3.Either<_i10.Failure, _i13.UserDetail>> loadDetail(
          String? username) =>
      (super.noSuchMethod(Invocation.method(#loadDetail, [username]),
          returnValue: Future<_i3.Either<_i10.Failure, _i13.UserDetail>>.value(
              _FakeEither_1<_i10.Failure, _i13.UserDetail>())) as _i6
          .Future<_i3.Either<_i10.Failure, _i13.UserDetail>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i14.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i14.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i14.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i14.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i15.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i15.Uint8List>.value(_i15.Uint8List(0)))
          as _i6.Future<_i15.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
