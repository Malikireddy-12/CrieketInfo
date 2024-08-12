import 'dart:convert';

import 'package:cricket_info/core/utils/typedefs.dart';
import 'package:cricket_info/src/matches/domain/matches_list_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import 'data_source/remote/remote_data.dart';
import 'matches_list_model.dart';

class MatchesListRepoImpl extends MatchesListRepo {
  MatchesListRepoImpl(this._remoteDataSource);

  final RemoteDataSource _remoteDataSource;

  @override
  ResultFuture<MatchesListModel> matchesList(String email) async {
    try {
      final result = await _remoteDataSource.matchesList(email);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
