part of 'matches_list_cubit.dart';

abstract class MatchesListState extends Equatable {
  const MatchesListState();
  @override
  List<Object> get props => [];
}

class MatchesListInitial extends MatchesListState {
  const MatchesListInitial();
}

class MatchesListLoading extends MatchesListState {
  const MatchesListLoading();
}

class MatchesListLoaded extends MatchesListState {
  const MatchesListLoaded({
    this.response = const MatchesList.empty(),
    this.seriesMatches = const [],
    this.selectedMatchFilter = 0,
    this.filters = const FiltersEntity.empty(),
    this.appIndex = const AppIndexEntity.empty(),
    this.responseLastUpdated = "",
  });

  final MatchesList response;
  final int selectedMatchFilter;
  final List<SeriesMatchesEntity>? seriesMatches;
  final FiltersEntity filters;
  final AppIndexEntity appIndex;
  final String responseLastUpdated;
}

class MatchesListError extends MatchesListState {
  const MatchesListError({required this.message});

  final String message;

  @override
  List<String> get props => [message];
}
