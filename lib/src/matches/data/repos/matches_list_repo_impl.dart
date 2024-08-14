import 'package:cricket_info/core/errors/exceptions.dart';
import 'package:cricket_info/core/errors/failures.dart';
import 'package:cricket_info/core/utils/typedefs.dart';
import 'package:cricket_info/src/matches/data/data_source/remote/remote_data.dart';
import 'package:cricket_info/src/matches/data/model/matches_list_model.dart';
import 'package:cricket_info/src/matches/domain/repos/matches_list_repo.dart';
import 'package:dartz/dartz.dart';

class MatchesListRepoImpl implements MatchesListRepo {
  MatchesListRepoImpl(this._remoteDataSource);

  final RemoteDataSourceImpl _remoteDataSource;

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
