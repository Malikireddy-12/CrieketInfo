import 'package:cricket_info/core/utils/typedefs.dart';

import '../../domain/entities/matches_list_entities.dart';

class MatchesListModel extends MatchesList {
  // final List<TypeMatches>? typeMatches;
  // final Filters? filters;
  // final AppIndex? appIndex;
  // final String? responseLastUpdated;
  const MatchesListModel({
    required List<TypeMatches> typeMatches,
    required Filters filters,
    required AppIndex appIndex,
    required String responseLastUpdated,
  }) : super(
            typeMatches: typeMatches,
            filters: filters,
            appIndex: appIndex,
            responseLastUpdated: responseLastUpdated);

  factory MatchesListModel.fromJson(DataMap json) {
    return MatchesListModel(
      typeMatches: json['typeMatches'] != null
          ? List<TypeMatches>.from(json['typeMatches']
              .where((e) => e != null)
              .map((e) => TypeMatches.fromJson(e)))
          : [],
      filters: Filters.fromJson(json['filters']),
      appIndex: AppIndex.fromJson(json['appIndex']),
      responseLastUpdated: json['responseLastUpdated'],
    );
  }
}

class TypeMatches extends TypeMatchesEntity {
  // final String? matchType;
  // final List<SeriesMatches>? seriesMatches;
  const TypeMatches(
      {required String? matchType, required List<SeriesMatches>? seriesMatches})
      : super(matchType: matchType, seriesMatches: seriesMatches);

  factory TypeMatches.fromJson(DataMap json) {
    return TypeMatches(
        matchType: json['matchType'],
        seriesMatches: json['seriesMatches'] != null
            ? List<SeriesMatches>.from(
                json['seriesMatches'].map((e) => SeriesMatches.fromJson(e)))
            : []);
  }
}

class SeriesMatches extends SeriesMatchesEntity {
  // final SeriesAdWrapper? seriesAdWrapper;
  // final AdDetail? adDetail;

  const SeriesMatches(
      {required SeriesAdWrapper? seriesAdWrapper, required AdDetail? adDetail})
      : super(seriesAdWrapper: seriesAdWrapper, adDetail: adDetail);

  factory SeriesMatches.fromJson(DataMap json) {
    return SeriesMatches(
        seriesAdWrapper: json['seriesAdWrapper'] != null
            ? SeriesAdWrapper.fromJson(json['seriesAdWrapper'])
            : null,
        adDetail: json['adDetail'] != null
            ? AdDetail.fromJson(json['adDetail'])
            : null);
  }
}

class SeriesAdWrapper extends SeriesAdWrapperEntity {
  // final int? seriesId;
  // final String? seriesName;
  // final List<Matches>? matches;

  const SeriesAdWrapper(
      {required int? seriesId,
      required String? seriesName,
      required List<Matches>? matches})
      : super(seriesId: seriesId, seriesName: seriesName, matches: matches);

  factory SeriesAdWrapper.fromJson(DataMap json) {
    return SeriesAdWrapper(
        seriesId: json['seriesId'] ?? 0,
        seriesName: json['seriesName'] ?? "",
        matches: json['matches'] != null
            ? List<Matches>.from(
                json['matches'].map((e) => Matches.fromJson(e)))
            : []);
  }
}

class Matches extends MatchesEntity {
  // final MatchInfo? matchInfo;
  // final MatchScore? matchScore;

  const Matches(
      {required MatchInfo? matchInfo, required MatchScore? matchScore})
      : super(matchInfo: matchInfo, matchScore: matchScore);

  factory Matches.fromJson(DataMap json) {
    return Matches(
        matchInfo: json['matchInfo'] != null
            ? MatchInfo.fromJson(json['matchInfo'])
            : null,
        matchScore: json['matchScore'] != null
            ? MatchScore.fromJson(json['matchScore'])
            : null);
  }
}

class MatchInfo extends MatchInfoEntity {
  // final int? matchId;
  // final int? seriesId;
  // final String? seriesName;
  // final String? matchDesc;
  // final String? matchFormat;
  // final String? startDate;
  // final String? endDate;
  // final String? state;
  // final String? status;
  // final Team1? team1;
  // final Team1? team2;
  // final VenueInfo? venueInfo;
  // final int? currBatTeamId;
  // final String? seriesStartDt;
  // final String? seriesEndDt;
  // final bool? isTimeAnnounced;
  // final String? stateTitle;

  const MatchInfo({
    required int? matchId,
    required int? seriesId,
    required String? seriesName,
    required String? matchDesc,
    required String? matchFormat,
    required String? startDate,
    required String? endDate,
    required String? state,
    required String? status,
    required Team1? team1,
    required Team1? team2,
    required VenueInfo? venueInfo,
    required int? currBatTeamId,
    required String? seriesStartDt,
    required String? seriesEndDt,
    required bool? isTimeAnnounced,
    required String? stateTitle,
  }) : super(
            matchId: matchId,
            seriesId: seriesId,
            seriesName: seriesName,
            matchDesc: matchDesc,
            matchFormat: matchFormat,
            startDate: startDate,
            endDate: endDate,
            state: state,
            status: status,
            team1: team1,
            team2: team2,
            venueInfo: venueInfo,
            currBatTeamId: currBatTeamId,
            seriesStartDt: seriesStartDt,
            seriesEndDt: seriesEndDt,
            isTimeAnnounced: isTimeAnnounced,
            stateTitle: stateTitle);

  factory MatchInfo.fromJson(DataMap json) {
    return MatchInfo(
        matchId: json['matchId'] ?? 0,
        seriesId: json['seriesId'] ?? 0,
        seriesName: json['seriesName'] ?? '',
        matchDesc: json['matchDesc'] ?? '',
        matchFormat: json['matchFormat'] ?? '',
        startDate: json['startDate'] ?? '',
        endDate: json['endDate'] ?? '',
        state: json['state'] ?? '',
        status: json['status'] ?? '',
        team1: json['team1'] != null ? Team1.fromJson(json['team1']) : null,
        team2: json['team2'] != null ? Team1.fromJson(json['team2']) : null,
        venueInfo: json['venueInfo'] != null
            ? VenueInfo.fromJson(json['venueInfo'])
            : null,
        currBatTeamId: json['currBatTeamId'] ?? '',
        seriesStartDt: json['seriesStartDt'] ?? '',
        seriesEndDt: json['seriesEndDt'] ?? '',
        isTimeAnnounced: json['isTimeAnnounced'] ?? '',
        stateTitle: json['stateTitle'] ?? '');
  }
}

class Team1 extends Team1Entity {
  // final int? teamId;
  // final String? teamName;
  // final String? teamSName;
  // final int? imageId;

  const Team1(
      {required int? teamId,
      required String? teamName,
      required String? teamSName,
      required int? imageId})
      : super(
            teamId: teamId,
            teamSName: teamSName,
            teamName: teamName,
            imageId: imageId);

  factory Team1.fromJson(DataMap json) {
    return Team1(
        teamId: json['teamId'] ?? 0,
        teamName: json['teamName'] ?? "",
        teamSName: json['teamSName'] ?? "",
        imageId: json['imageId'] ?? 0);
  }
}

class VenueInfo extends VenueInfoEntity {
  // final int? id;
  // final String? ground;
  // final String? city;
  // final String? timezone;

  const VenueInfo(
      {required int? id,
      required String? ground,
      required String? city,
      required String? timezone})
      : super(id: id, ground: ground, city: city, timezone: timezone);

  factory VenueInfo.fromJson(DataMap json) {
    return VenueInfo(
      id: json['id'] ?? 0,
      ground: json['ground'] ?? "",
      city: json['city'] ?? "",
      timezone: json['timezone'],
    );
  }
}

class MatchScore extends MatchScoreEntity {
  // final Team1Score? team1Score;
  // final Team1Score? team2Score;

  const MatchScore(
      {required Team1Score? team1Score, required Team1Score? team2Score})
      : super(team1Score: team1Score, team2Score: team2Score);

  factory MatchScore.fromJson(DataMap json) {
    return MatchScore(
        team1Score: json['team1Score'] != null
            ? Team1Score.fromJson(json['team1Score'])
            : null,
        team2Score: json['team2Score'] != null
            ? Team1Score.fromJson(json['team2Score'])
            : null);
  }
}

class Team1Score extends Team1ScoreEntity {
  // final Inngs1? inngs1;

  const Team1Score({required Inngs1? inngs1}) : super(inngs1: inngs1);

  factory Team1Score.fromJson(DataMap json) {
    return Team1Score(
        inngs1:
            json['inngs1'] != null ? Inngs1.fromJson(json['inngs1']) : null);
  }
}

class Inngs1 extends Inngs1Entity {
  // final int? inningsId;
  // final int? runs;
  // final int? wickets;
  // final double? overs;

  const Inngs1(
      {required int? inningsId,
      required int? runs,
      required int? wickets,
      required int? overs});

  factory Inngs1.fromJson(DataMap json) {
    return Inngs1(
        inningsId: json['inningsId'] ?? 0,
        runs: json['runs'] ?? 0,
        wickets: json['wickets'] ?? 0,
        overs: json['overs'] ?? 0.0);
  }
}

class AdDetail extends AdDetailEntity {
  // final String? name;
  // final String? layout;
  // final int? position;

  const AdDetail(
      {required String? name, required String? layout, required int? position})
      : super(name: name, layout: layout, position: position);

  factory AdDetail.fromJson(DataMap json) {
    return AdDetail(
        name: json['name'] ?? "",
        layout: json['layout'] ?? "",
        position: json['position'] ?? 0);
  }
}

class Filters extends FiltersEntity {
  const Filters({required List<String> matchType})
      : super(matchType: matchType);

  factory Filters.fromJson(DataMap json) {
    return Filters(matchType: json['matchType'].cast<String>());
  }
}

class AppIndex extends AppIndexEntity {
  const AppIndex({required String? seoTitle, required String? webURL})
      : super(seoTitle: seoTitle, webURL: webURL);

  factory AppIndex.fromJson(DataMap json) {
    return AppIndex(
        seoTitle: json['seoTitle'] ?? "", webURL: json['webURL'] ?? "");
  }
}
