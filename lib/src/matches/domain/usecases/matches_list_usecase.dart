import 'package:cricket_info/core/usecases/usecases.dart';
import 'package:cricket_info/core/utils/typedefs.dart';
import 'package:cricket_info/src/matches/data/model/matches_list_model.dart';
import 'package:cricket_info/src/matches/domain/repos/matches_list_repo.dart';
import 'package:equatable/equatable.dart';

class MatchesListUsecases
    implements UsecaseWithParams<MatchesListModel, MatchesListParams> {
  const MatchesListUsecases( MatchesListRepo repo) : _repo = repo;

  final MatchesListRepo _repo;

  @override
  ResultFuture<MatchesListModel> call(MatchesListParams params) async =>
      _repo.matchesList(params.matchType);
}

class MatchesListParams extends Equatable {
  const MatchesListParams(this.matchType);
  const MatchesListParams.empty() : matchType = '';
  final String matchType;
  @override
  List<Object?> get props => [matchType];
}
