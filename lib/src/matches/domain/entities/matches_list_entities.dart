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
            filters: const Filters.empty(),
            appIndex: const AppIndex.empty(),
            responseLastUpdated: "");
  final List<TypeMatches> typeMatches;
  final Filters filters;
  final AppIndex appIndex;
  final String responseLastUpdated;

  @override
  List<Object?> get props =>
      [typeMatches, filters, appIndex, responseLastUpdated];
}

class TypeMatches extends Equatable {
  final String? matchType;
  final List<SeriesMatches>? seriesMatches;

  const TypeMatches({this.matchType, this.seriesMatches});
  const TypeMatches.empty() : this(matchType: "", seriesMatches: const []);

  @override
  List<Object?> get props => [matchType, seriesMatches];
}

class SeriesMatches extends Equatable {
  final SeriesAdWrapper? seriesAdWrapper;
  final AdDetail? adDetail;

  const SeriesMatches({this.seriesAdWrapper, this.adDetail});
  const SeriesMatches.empty()
      : this(
          seriesAdWrapper: const SeriesAdWrapper.empty(),
          adDetail: const AdDetail.empty(),
        );

  @override
  List<Object?> get props => [seriesAdWrapper, adDetail];
}

class SeriesAdWrapper extends Equatable {
  final int? seriesId;
  final String? seriesName;
  final List<Matches>? matches;

  const SeriesAdWrapper({this.seriesId, this.seriesName, this.matches});

  const SeriesAdWrapper.empty()
      : this(seriesId: 0, seriesName: "", matches: const []);

  @override
  List<Object?> get props => [seriesId, seriesName, matches];
}

class Matches extends Equatable {
  final MatchInfo? matchInfo;
  final MatchScore? matchScore;

  const Matches({this.matchInfo, this.matchScore});
  const Matches.empty()
      : this(
          matchInfo: const MatchInfo.empty(),
          matchScore: const MatchScore.empty(),
        );

  @override
  List<Object?> get props => [matchInfo, matchScore];
}

class MatchInfo extends Equatable {
  final int? matchId;
  final int? seriesId;
  final String? seriesName;
  final String? matchDesc;
  final String? matchFormat;
  final String? startDate;
  final String? endDate;
  final String? state;
  final String? status;
  final Team1? team1;
  final Team1? team2;
  final VenueInfo? venueInfo;
  final int? currBatTeamId;
  final String? seriesStartDt;
  final String? seriesEndDt;
  final bool? isTimeAnnounced;
  final String? stateTitle;

  const MatchInfo(
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
  const MatchInfo.empty()
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
            team1: const Team1.empty(),
            team2: const Team1.empty(),
            venueInfo: const VenueInfo.empty(),
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

class Team1 extends Equatable {
  final int? teamId;
  final String? teamName;
  final String? teamSName;
  final int? imageId;

  const Team1({this.teamId, this.teamName, this.teamSName, this.imageId});
  const Team1.empty()
      : this(teamId: 0, teamName: "", teamSName: "", imageId: 0);

  @override
  List<Object?> get props => [teamId, teamName, teamSName, imageId];
}

class VenueInfo extends Equatable {
  final int? id;
  final String? ground;
  final String? city;
  final String? timezone;

  const VenueInfo({this.id, this.ground, this.city, this.timezone});
  const VenueInfo.empty() : this(id: 0, ground: "", city: "", timezone: "");
  @override
  List<Object?> get props => [id, ground, city, timezone];
}

class MatchScore extends Equatable {
  final Team1Score? team1Score;
  final Team1Score? team2Score;

  const MatchScore({this.team1Score, this.team2Score});
  const MatchScore.empty()
      : this(
            team1Score: const Team1Score.empty(),
            team2Score: const Team1Score.empty());

  @override
  List<Object?> get props => [team1Score, team2Score];
}

class Team1Score extends Equatable {
  final Inngs1? inngs1;

  const Team1Score({this.inngs1});
  const Team1Score.empty() : this(inngs1: const Inngs1.empty());

  @override
  List<Object?> get props => [inngs1];
}

class Inngs1 extends Equatable {
  final int? inningsId;
  final int? runs;
  final int? wickets;
  final double? overs;

  const Inngs1({this.inningsId, this.runs, this.wickets, this.overs});
  const Inngs1.empty() : this(inningsId: 0, runs: 0, wickets: 0, overs: 0);

  @override
  List<Object?> get props => [inningsId, runs, wickets, overs];
}

class AdDetail extends Equatable {
  final String? name;
  final String? layout;
  final int? position;

  const AdDetail({this.name, this.layout, this.position});
  const AdDetail.empty() : this(name: "", layout: "", position: 0);

  @override
  List<Object?> get props => [name, layout, position];
}

class Filters extends Equatable {
  final List<String> matchType;
  const Filters({required this.matchType});
  const Filters.empty() : this(matchType: const []);

  @override
  List<Object?> get props => [matchType];
}

class AppIndex extends Equatable {
  final String? seoTitle;
  final String? webURL;

  const AppIndex({this.seoTitle, this.webURL});
  const AppIndex.empty() : this(seoTitle: "", webURL: "");

  @override
  List<Object?> get props => [seoTitle, webURL];
}
