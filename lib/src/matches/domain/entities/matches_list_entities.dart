import 'package:equatable/equatable.dart';

class MatchesList extends Equatable {
  const MatchesList(
      {required this.typeMatches,
      required this.filters,
      required this.appIndex,
      required this.responseLastUpdated});
  const MatchesList.empty()
      : this(
            typeMatches: const [],
            filters: const FiltersEntity.empty(),
            appIndex: const AppIndexEntity.empty(),
            responseLastUpdated: "");
  final List<TypeMatchesEntity> typeMatches;
  final FiltersEntity filters;
  final AppIndexEntity appIndex;
  final String responseLastUpdated;

  @override
  List<Object?> get props =>
      [typeMatches, filters, appIndex, responseLastUpdated];
}

class TypeMatchesEntity extends Equatable {
  final String? matchType;
  final List<SeriesMatchesEntity>? seriesMatches;

  const TypeMatchesEntity({this.matchType, this.seriesMatches});
  const TypeMatchesEntity.empty() : this(matchType: "", seriesMatches: const []);

  @override
  List<Object?> get props => [matchType, seriesMatches];
}

class SeriesMatchesEntity extends Equatable {
  final SeriesAdWrapperEntity? seriesAdWrapper;
  final AdDetailEntity? adDetail;

  const SeriesMatchesEntity({this.seriesAdWrapper, this.adDetail});
  const SeriesMatchesEntity.empty()
      : this(
          seriesAdWrapper: const SeriesAdWrapperEntity.empty(),
          adDetail: const AdDetailEntity.empty(),
        );

  @override
  List<Object?> get props => [seriesAdWrapper, adDetail];
}

class SeriesAdWrapperEntity extends Equatable {
  final int? seriesId;
  final String? seriesName;
  final List<MatchesEntity>? matches;

  const SeriesAdWrapperEntity({this.seriesId, this.seriesName, this.matches});

  const SeriesAdWrapperEntity.empty()
      : this(seriesId: 0, seriesName: "", matches: const []);

  @override
  List<Object?> get props => [seriesId, seriesName, matches];
}

class MatchesEntity extends Equatable {
  final MatchInfoEntity? matchInfo;
  final MatchScoreEntity? matchScore;

  const MatchesEntity({this.matchInfo, this.matchScore});
  const MatchesEntity.empty()
      : this(
          matchInfo: const MatchInfoEntity.empty(),
          matchScore: const MatchScoreEntity.empty(),
        );

  @override
  List<Object?> get props => [matchInfo, matchScore];
}

class MatchInfoEntity extends Equatable {
  final int? matchId;
  final int? seriesId;
  final String? seriesName;
  final String? matchDesc;
  final String? matchFormat;
  final String? startDate;
  final String? endDate;
  final String? state;
  final String? status;
  final Team1Entity? team1;
  final Team1Entity? team2;
  final VenueInfoEntity? venueInfo;
  final int? currBatTeamId;
  final String? seriesStartDt;
  final String? seriesEndDt;
  final bool? isTimeAnnounced;
  final String? stateTitle;

  const MatchInfoEntity(
      {this.matchId,
      this.seriesId,
      this.seriesName,
      this.matchDesc,
      this.matchFormat,
      this.startDate,
      this.endDate,
      this.state,
      this.status,
      this.team1,
      this.team2,
      this.venueInfo,
      this.currBatTeamId,
      this.seriesStartDt,
      this.seriesEndDt,
      this.isTimeAnnounced,
      this.stateTitle});
  const MatchInfoEntity.empty()
      : this(
            matchId: 0,
            seriesId: 0,
            seriesName: "",
            matchDesc: "",
            matchFormat: "",
            startDate: "",
            endDate: "",
            state: "",
            status: "",
            team1: const Team1Entity.empty(),
            team2: const Team1Entity.empty(),
            venueInfo: const VenueInfoEntity.empty(),
            currBatTeamId: 0,
            seriesStartDt: "",
            seriesEndDt: "",
            isTimeAnnounced: false,
            stateTitle: "");

  @override
  List<Object?> get props => [
        matchId,
        seriesId,
        seriesName,
        matchDesc,
        matchFormat,
        startDate,
        endDate,
        state,
        status,
        team1,
        team2,
        venueInfo,
        currBatTeamId,
        seriesStartDt,
        seriesEndDt,
        isTimeAnnounced,
        stateTitle
      ];
}

class Team1Entity extends Equatable {
  final int? teamId;
  final String? teamName;
  final String? teamSName;
  final int? imageId;

  const Team1Entity({this.teamId, this.teamName, this.teamSName, this.imageId});
  const Team1Entity.empty()
      : this(teamId: 0, teamName: "", teamSName: "", imageId: 0);

  @override
  List<Object?> get props => [teamId, teamName, teamSName, imageId];
}

class VenueInfoEntity extends Equatable {
  final int? id;
  final String? ground;
  final String? city;
  final String? timezone;

  const VenueInfoEntity({this.id, this.ground, this.city, this.timezone});
  const VenueInfoEntity.empty() : this(id: 0, ground: "", city: "", timezone: "");
  @override
  List<Object?> get props => [id, ground, city, timezone];
}

class MatchScoreEntity extends Equatable {
  final Team1ScoreEntity? team1Score;
  final Team1ScoreEntity? team2Score;

  const MatchScoreEntity({this.team1Score, this.team2Score});
  const MatchScoreEntity.empty()
      : this(
            team1Score: const Team1ScoreEntity.empty(),
            team2Score: const Team1ScoreEntity.empty());

  @override
  List<Object?> get props => [team1Score, team2Score];
}

class Team1ScoreEntity extends Equatable {
  final Inngs1Entity? inngs1;
  final Inngs1Entity? inngs2;

  const Team1ScoreEntity({this.inngs1,this.inngs2,});
  const Team1ScoreEntity.empty() : this(inngs1: const Inngs1Entity.empty(),inngs2:const Inngs1Entity.empty());

  @override
  List<Object?> get props => [inngs1,inngs2];
}

class Inngs1Entity extends Equatable {
  final int? inningsId;
  final int? runs;
  final int? wickets;
  final double? overs;

  const Inngs1Entity({this.inningsId, this.runs, this.wickets, this.overs});
  const Inngs1Entity.empty() : this(inningsId: 0, runs: 0, wickets: 0, overs: 0);

  @override
  List<Object?> get props => [inningsId, runs, wickets, overs];
}

class AdDetailEntity extends Equatable {
  final String? name;
  final String? layout;
  final int? position;

  const AdDetailEntity({this.name, this.layout, this.position});
  const AdDetailEntity.empty() : this(name: "", layout: "", position: 0);

  @override
  List<Object?> get props => [name, layout, position];
}

class FiltersEntity extends Equatable {
  final List<String> matchType;
  const FiltersEntity({required this.matchType});
  const FiltersEntity.empty() : this(matchType: const []);

  @override
  List<Object?> get props => [matchType];
}

class AppIndexEntity extends Equatable {
  final String? seoTitle;
  final String? webURL;

  const AppIndexEntity({this.seoTitle, this.webURL});
  const AppIndexEntity.empty() : this(seoTitle: "", webURL: "");

  @override
  List<Object?> get props => [seoTitle, webURL];
}
