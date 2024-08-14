import 'package:cricket_info/core/utils/typedefs.dart';
import 'package:cricket_info/src/matches/data/model/matches_list_model.dart';

abstract class MatchesListRepo  {

  const MatchesListRepo();

  ResultFuture<MatchesListModel> matchesList(String email);

}