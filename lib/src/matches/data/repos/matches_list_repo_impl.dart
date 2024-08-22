import 'package:cricket_info/core/errors/exceptions.dart';
import 'package:cricket_info/core/errors/failures.dart';
import 'package:cricket_info/core/utils/typedefs.dart';
import 'package:cricket_info/src/matches/data/data_source/local/local_data.dart';
import 'package:cricket_info/src/matches/data/data_source/remote/remote_data.dart';
import 'package:cricket_info/src/matches/data/model/matches_list_model.dart';
import 'package:cricket_info/src/matches/domain/repos/matches_list_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

typedef _MatchListData = Future<MatchesListModel> Function();

class MatchesListRepoImpl implements MatchesListRepo {
  MatchesListRepoImpl(
      {required RemoteDataSourceImpl remoteDataSource,
      required LocalDataSourceImpl localDataSource})
      : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final RemoteDataSourceImpl _remoteDataSource;
  final LocalDataSourceImpl _localDataSource;

  @override
  ResultFuture<MatchesListModel> matchesList(String email) async {
    try {
      final result = await _remoteDataSource.matchesList(email);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  ResultFuture<MatchesListModel> _getTrivia(
    _MatchListData matchListData,
  ) async {
    final hasConnected = await InternetConnectionChecker().hasConnection;
    if (hasConnected) {
      try {
        final remoteMatchList = await matchListData();
        _localDataSource.setMatchList(remoteMatchList.toString());
        return Right(remoteMatchList);
      } on ServerException {
        return Left(ServerFailure(message: '', statusCode: null));
      }
    } else {
      try {
        final localMatchList = await _localDataSource.getMatchList();
        return Right(localMatchList);
      } on CacheException {
        return Left(CacheFailure(message: '', statusCode: null));
      }
    }
  }
}
