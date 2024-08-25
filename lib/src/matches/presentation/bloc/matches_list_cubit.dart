import 'package:cricket_info/src/matches/domain/entities/matches_list_entities.dart' as entities;
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

  Future<void> matchesListAPi() async {
    emit(const MatchesListLoading());
    final result = await _matchesList.call(const MatchesListParams.empty());

    result.fold(
          (failure) {
        emit(MatchesListError(message: failure.errorMessage));
      },
          (response) async {
        emit(MatchesListLoaded(response:entities.MatchesList(typeMatches: response.typeMatches.map((e)=>entities.TypeMatchesEntity(matchType: e.matchType,seriesMatches: e.seriesMatches!.map((v)=> entities.SeriesMatchesEntity(seriesAdWrapper: entities.SeriesAdWrapperEntity(seriesId: v.seriesAdWrapper!.seriesId,seriesName: v.seriesAdWrapper!.seriesName,matches: v.seriesAdWrapper!.matches!.map((r)=>entities.MatchesEntity(matchScore:entities.MatchScoreEntity(team2Score: entities.Team1ScoreEntity(inngs1: entities.Inngs1Entity(inningsId: r.matchScore!.team1Score!.inngs1!.inningsId,runs: r.matchScore!.team1Score!.inngs1!.runs,wickets: r.matchScore!.team1Score!.inngs1!.wickets,overs: r.matchScore!.team1Score!.inngs1!.overs)),team1Score: entities.Team1ScoreEntity(inngs1: entities.Inngs1Entity(inningsId: r.matchScore!.team1Score!.inngs1!.inningsId,runs: r.matchScore!.team1Score!.inngs1!.runs,wickets: r.matchScore!.team1Score!.inngs1!.wickets,overs: r.matchScore!.team1Score!.inngs1!.overs))),matchInfo:entities.MatchInfoEntity( matchId: 0,
            seriesId: r.matchInfo!.seriesId,
            seriesName: r.matchInfo!.seriesName,
            matchDesc: r.matchInfo!.matchDesc,
            matchFormat: r.matchInfo!.matchDesc,
            startDate: r.matchInfo!.startDate,
            endDate: r.matchInfo!.endDate,
            state: r.matchInfo!.state,
            status: r.matchInfo!.status,
            team1:  entities.Team1Entity(teamId: r.matchInfo!.team1!.teamId,teamName: r.matchInfo!.team1!.teamName,teamSName: r.matchInfo!.team1!.teamSName,imageId:r.matchInfo!.team1!.imageId ),
            team2: entities.Team1Entity(teamId: r.matchInfo!.team2!.teamId,teamName: r.matchInfo!.team2!.teamName,teamSName: r.matchInfo!.team2!.teamSName,imageId:r.matchInfo!.team2!.imageId ),
            venueInfo: entities.VenueInfoEntity(id: r.matchInfo!.venueInfo!.id,ground: r.matchInfo!.venueInfo!.ground,city: r.matchInfo!.venueInfo!.city,timezone:r.matchInfo!.venueInfo!.timezone ),
            currBatTeamId: r.matchInfo!.currBatTeamId,
            seriesStartDt: r.matchInfo!.seriesStartDt,
            seriesEndDt: r.matchInfo!.seriesEndDt,
            isTimeAnnounced: r.matchInfo!.isTimeAnnounced,
            stateTitle: r.matchInfo!.stateTitle) )).toList() ),adDetail:entities.AdDetailEntity(name: v.adDetail!.name,layout: v.adDetail!.layout,position: v.adDetail!.position) )).toList())).toList(),filters: entities.FiltersEntity(matchType:response.filters.matchType.map((e)=>e).toList()),appIndex:entities.AppIndexEntity(seoTitle: response.appIndex.seoTitle,webURL: response.appIndex.webURL) ,responseLastUpdated:response.responseLastUpdated ) ));
      },
    );
  }
}

