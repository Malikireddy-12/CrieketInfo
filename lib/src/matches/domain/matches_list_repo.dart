import '../../../core/utils/typedefs.dart';

abstract class MatchesListRepo  {

  const MatchesListRepo();

  ResultFuture<void> matchesList(String email);

}