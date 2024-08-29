import 'package:cricket_info/src/matches/data/model/matches_list_model.dart';
import 'package:cricket_info/src/matches/domain/entities/matches_list_entities.dart'
    as entities;
import 'package:cricket_info/src/matches/domain/entities/matches_list_entities.dart';
import 'package:cricket_info/src/matches/domain/usecases/matches_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'matches_list_state.dart';

class MatchesListCubit extends Cubit<MatchesListState> {
  MatchesListCubit(MatchesListUsecases matchesList)
      : _matchesList = matchesList,
        super(const MatchesListInitial());
  final MatchesListUsecases _matchesList;
  int selectedFilter = 0;
  Future<void> matchesListAPi({String? filterName}) async {
    emit(const MatchesListLoading());
    final result = await _matchesList.call(const MatchesListParams.empty());

    result.fold(
      (failure) {
        emit(MatchesListError(message: failure.errorMessage));
      },
      (response) async {
        emit(
          MatchesListLoaded(
              filters: entities.FiltersEntity(
                matchType: filters(response.filters.matchType),
              ),
              selectedMatchFilter: selectedFilter,
              seriesMatches: filterName == null
                  ? getDataFromSeriesAdWrapper(response)
                  : filterSeriesAdWrapper(response, filterName),
              appIndex: entities.AppIndexEntity(
                  seoTitle: response.appIndex.seoTitle,
                  webURL: response.appIndex.webURL),
              responseLastUpdated: response.responseLastUpdated),
        );
      },
    );
  }

  List<String> filters(List<String> filters) {
    List<String> list = [];
    list.addAll(filters);
    list.insert(0, "All");
    return list;
  }

  List<SeriesMatchesEntity> getDataFromSeriesAdWrapper(
    MatchesListModel response,
  ) {
    List<SeriesMatchesEntity> seriesMatches = [];
    for (var typeMatch in response.typeMatches) {
      for (var element in typeMatch.seriesMatches!) {
        matchListData(element, seriesMatches);
      }
    }

    return seriesMatches;
  }

  void matchListData(entities.SeriesMatchesEntity element,
      List<entities.SeriesMatchesEntity> seriesMatches) {
    if (element.seriesAdWrapper != null) {
      seriesMatches.add(
        entities.SeriesMatchesEntity(
          seriesAdWrapper: entities.SeriesAdWrapperEntity(
              seriesId: element.seriesAdWrapper!.seriesId,
              seriesName: element.seriesAdWrapper!.seriesName,
              matches: element.seriesAdWrapper!.matches!
                  .map(
                    (r) => entities.MatchesEntity(
                      matchInfo: entities.MatchInfoEntity(
                          matchId: r.matchInfo!.matchId,
                          seriesId: r.matchInfo!.seriesId,
                          seriesName: r.matchInfo!.seriesName,
                          matchDesc: r.matchInfo!.matchDesc,
                          matchFormat: r.matchInfo!.matchDesc,
                          startDate: r.matchInfo!.startDate,
                          endDate: r.matchInfo!.endDate,
                          state: r.matchInfo!.state,
                          status: r.matchInfo!.status,
                          team1: entities.Team1Entity(
                              teamId: r.matchInfo!.team1!.teamId,
                              teamName: r.matchInfo!.team1!.teamName,
                              teamSName: r.matchInfo!.team1!.teamSName,
                              imageId: r.matchInfo!.team1!.imageId),
                          team2: entities.Team1Entity(
                              teamId: r.matchInfo!.team2!.teamId,
                              teamName: r.matchInfo!.team2!.teamName,
                              teamSName: r.matchInfo!.team2!.teamSName,
                              imageId: r.matchInfo!.team2!.imageId),
                          venueInfo: entities.VenueInfoEntity(
                              id: r.matchInfo!.venueInfo!.id,
                              ground: r.matchInfo!.venueInfo!.ground,
                              city: r.matchInfo!.venueInfo!.city,
                              timezone: r.matchInfo!.venueInfo!.timezone),
                          currBatTeamId: r.matchInfo!.currBatTeamId,
                          seriesStartDt: r.matchInfo!.seriesStartDt,
                          seriesEndDt: r.matchInfo!.seriesEndDt,
                          isTimeAnnounced: r.matchInfo!.isTimeAnnounced,
                          stateTitle: r.matchInfo!.stateTitle),
                      matchScore: entities.MatchScoreEntity(
                        team2Score: r.matchScore?.team2Score != null
                            ? entities.Team1ScoreEntity(
                                inngs1: entities.Inngs1Entity(
                                    inningsId: r.matchScore!.team2Score!.inngs1!
                                        .inningsId,
                                    runs:
                                        r.matchScore!.team2Score!.inngs1!.runs,
                                    wickets: r.matchScore!.team2Score!.inngs1!
                                        .wickets,
                                    overs: r
                                        .matchScore!.team2Score!.inngs1!.overs),
                              )
                            : const entities.Team1ScoreEntity.empty(),
                        team1Score: entities.Team1ScoreEntity(
                            inngs1: r.matchScore?.team1Score?.inngs1 != null
                                ? entities.Inngs1Entity(
                                    inningsId: r.matchScore!.team1Score!.inngs1!
                                        .inningsId,
                                    runs:
                                        r.matchScore!.team1Score!.inngs1!.runs,
                                    wickets: r.matchScore!.team1Score!.inngs1!
                                        .wickets,
                                    overs:
                                        r.matchScore!.team1Score!.inngs1!.overs)
                                : const Inngs1Entity.empty()),
                      ),
                    ),
                  )
                  .toList()),
          adDetail: element.adDetail != null
              ? entities.AdDetailEntity(
                  name: element.adDetail!.name,
                  layout: element.adDetail!.layout,
                  position: element.adDetail!.position)
              : const entities.AdDetailEntity.empty(),
        ),
      );
    }
  }

  List<SeriesMatchesEntity> filterSeriesAdWrapper(
      MatchesListModel response, String filterType) {
    List<SeriesMatchesEntity> seriesMatches = [];
    final typeMatches = response.typeMatches
        .firstWhere((element) => element.matchType == filterType);
    for (var element in typeMatches.seriesMatches!) {
      matchListData(element, seriesMatches);
    }

    return seriesMatches;
  }

  selectMatchTypeFilter(String name, int index) async {
    selectedFilter = index;
    emit(const MatchesListLoaded(
      seriesMatches: [],
    ));
    if (name != "All") {
      matchesListAPi(filterName: name);
    } else {
      matchesListAPi();
    }
  }
}
