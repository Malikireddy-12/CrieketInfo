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
  const MatchesListLoaded({required this.response});

  final MatchesList response;
}

class MatchesListError extends MatchesListState {
  const MatchesListError({required this.message});

  final String message;

  @override
  List<String> get props => [message];
}
