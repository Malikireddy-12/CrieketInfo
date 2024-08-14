import 'package:cricket_info/core/utils/typedefs.dart';
import 'package:cricket_info/src/matches/data/model/fields/matches_hive_types.dart';
import 'package:cricket_info/src/matches/data/model/fields/matches_list_main_fields.dart';
import 'package:hive/hive.dart';

part 'matches_list_model.g.dart';

@HiveType(typeId: MatchesHiveTypes.matchesList)
class MatchesListModel {
  @HiveField(MatchesListMainFields.typeMatches)
  final List<TypeMatches>? typeMatches;
  @HiveField(MatchesListMainFields.filters)
  final Filters? filters;
  @HiveField(MatchesListMainFields.appIndex)
  final AppIndex? appIndex;
  @HiveField(MatchesListMainFields.responseLastUpdated)
  final String? responseLastUpdated;

  MatchesListModel({
    this.typeMatches,
    this.filters,
    this.appIndex,
    this.responseLastUpdated,
  });

  MatchesListModel.fromJson(DataMap json)
      : typeMatches = json['typeMatches'] != null
            ? List<TypeMatches>.from(json['typeMatches']
                .where((e) => e != null)
                .map((e) => TypeMatches.fromJson(e)))
            : [],
        filters =
            json['filters'] != null ? Filters.fromJson(json['filters']) : null,
        appIndex = json['appIndex'] != null
            ? AppIndex.fromJson(json['appIndex'])
            : null,
        responseLastUpdated = json['responseLastUpdated'];
}

@HiveType(typeId: MatchesHiveTypes.typeMatches)
class TypeMatches {
  @HiveField(TypeMatchesFields.matchType)
  final String? matchType;
  @HiveField(TypeMatchesFields.seriesMatches)
  final List<SeriesMatches>? seriesMatches;

  TypeMatches({
    this.matchType,
    this.seriesMatches,
  });

  TypeMatches.fromJson(DataMap json)
      : matchType = json['matchType'],
        seriesMatches = json['seriesMatches'] != null
            ? List<SeriesMatches>.from(
                json['seriesMatches'].map((e) => SeriesMatches.fromJson(e)))
            : [];
}

@HiveType(typeId: MatchesHiveTypes.seriesMatches)
class SeriesMatches {
  @HiveField(SeriesMatchesFields.seriesAdWrapper)
  final SeriesAdWrapper? seriesAdWrapper;
  @HiveField(SeriesMatchesFields.adDetail)
  final AdDetail? adDetail;

  SeriesMatches({this.seriesAdWrapper, this.adDetail});

  SeriesMatches.fromJson(DataMap json)
      : seriesAdWrapper = json['seriesAdWrapper'] != null
            ? SeriesAdWrapper.fromJson(json['seriesAdWrapper'])
            : null,
        adDetail = json['adDetail'] != null
            ? AdDetail.fromJson(json['adDetail'])
            : null;
}

@HiveType(typeId: MatchesHiveTypes.seriesAdWrapper)
class SeriesAdWrapper {
  @HiveField(SeriesAdWrapperFields.seriesId)
  final int? seriesId;
  @HiveField(SeriesAdWrapperFields.seriesName)
  final String? seriesName;
  @HiveField(SeriesAdWrapperFields.matches)
  final List<Matches>? matches;

  SeriesAdWrapper({this.seriesId, this.seriesName, this.matches});

  SeriesAdWrapper.fromJson(DataMap json)
      : seriesId = json['seriesId'] ?? 0,
        seriesName = json['seriesName'] ?? "",
        matches = json['matches'] != null
            ? List<Matches>.from(
                json['matches'].map((e) => Matches.fromJson(e)))
            : [];
}

@HiveType(typeId: MatchesHiveTypes.matches)
class Matches {
  @HiveField(MatchesFields.matchInfo)
  final MatchInfo? matchInfo;
  @HiveField(MatchesFields.matchScore)
  final MatchScore? matchScore;

  Matches({this.matchInfo, this.matchScore});

  Matches.fromJson(DataMap json)
      : matchInfo = json['matchInfo'] != null
            ? MatchInfo.fromJson(json['matchInfo'])
            : null,
        matchScore = json['matchScore'] != null
            ? MatchScore.fromJson(json['matchScore'])
            : null;
}

@HiveType(typeId: MatchesHiveTypes.matchInfo)
class MatchInfo {
  @HiveField(MatchInfoFields.matchId)
  final int? matchId;
  @HiveField(MatchInfoFields.seriesId)
  final int? seriesId;
  @HiveField(MatchInfoFields.seriesName)
  final String? seriesName;
  @HiveField(MatchInfoFields.matchDesc)
  final String? matchDesc;
  @HiveField(MatchInfoFields.matchFormat)
  final String? matchFormat;
  @HiveField(MatchInfoFields.startDate)
  final String? startDate;
  @HiveField(MatchInfoFields.endDate)
  final String? endDate;
  @HiveField(MatchInfoFields.state)
  final String? state;
  @HiveField(MatchInfoFields.status)
  final String? status;
  @HiveField(MatchInfoFields.team1)
  final Team1? team1;
  @HiveField(MatchInfoFields.team2)
  final Team1? team2;
  @HiveField(MatchInfoFields.venueInfo)
  final VenueInfo? venueInfo;
  @HiveField(MatchInfoFields.currBatTeamId)
  final int? currBatTeamId;
  @HiveField(MatchInfoFields.seriesStartDt)
  final String? seriesStartDt;
  @HiveField(MatchInfoFields.seriesEndDt)
  final String? seriesEndDt;
  @HiveField(MatchInfoFields.isTimeAnnounced)
  final bool? isTimeAnnounced;
  @HiveField(MatchInfoFields.stateTitle)
  final String? stateTitle;

  MatchInfo(
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

  MatchInfo.fromJson(DataMap json)
      : matchId = json['matchId'] ?? 0,
        seriesId = json['seriesId'] ?? 0,
        seriesName = json['seriesName'] ?? '',
        matchDesc = json['matchDesc'] ?? '',
        matchFormat = json['matchFormat'] ?? '',
        startDate = json['startDate'] ?? '',
        endDate = json['endDate'] ?? '',
        state = json['state'] ?? '',
        status = json['status'] ?? '',
        team1 = json['team1'] != null ? Team1.fromJson(json['team1']) : null,
        team2 = json['team2'] != null ? Team1.fromJson(json['team2']) : null,
        venueInfo = json['venueInfo'] != null
            ? VenueInfo.fromJson(json['venueInfo'])
            : null,
        currBatTeamId = json['currBatTeamId'] ?? '',
        seriesStartDt = json['seriesStartDt'] ?? '',
        seriesEndDt = json['seriesEndDt'] ?? '',
        isTimeAnnounced = json['isTimeAnnounced'] ?? '',
        stateTitle = json['stateTitle'] ?? '';
}

@HiveType(typeId: MatchesHiveTypes.team1)
class Team1 {
  @HiveField(Team1Fields.teamId)
  final int? teamId;
  @HiveField(Team1Fields.teamName)
  final String? teamName;
  @HiveField(Team1Fields.teamSName)
  final String? teamSName;
  @HiveField(Team1Fields.imageId)
  final int? imageId;

  Team1({this.teamId, this.teamName, this.teamSName, this.imageId});

  Team1.fromJson(DataMap json)
      : teamId = json['teamId'] ?? 0,
        teamName = json['teamName'] ?? "",
        teamSName = json['teamSName'] ?? "",
        imageId = json['imageId'] ?? 0;
}

@HiveType(typeId: MatchesHiveTypes.venueInfo)
class VenueInfo {
  @HiveField(VenueInfoFields.id)
  final int? id;
  @HiveField(VenueInfoFields.ground)
  final String? ground;
  @HiveField(VenueInfoFields.city)
  final String? city;
  @HiveField(VenueInfoFields.timezone)
  final String? timezone;

  VenueInfo({this.id, this.ground, this.city, this.timezone});

  VenueInfo.fromJson(DataMap json)
      : id = json['id'] ?? 0,
        ground = json['ground'] ?? "",
        city = json['city'] ?? "",
        timezone = json['timezone'];
}

@HiveType(typeId: MatchesHiveTypes.matchScore)
class MatchScore {
  @HiveField(MatchScoreFields.team1Score)
  final Team1Score? team1Score;
  @HiveField(MatchScoreFields.team2Score)
  final Team1Score? team2Score;

  MatchScore({this.team1Score, this.team2Score});

  MatchScore.fromJson(DataMap json)
      : team1Score = json['team1Score'] != null
            ? Team1Score.fromJson(json['team1Score'])
            : null,
        team2Score = json['team2Score'] != null
            ? Team1Score.fromJson(json['team2Score'])
            : null;
}

@HiveType(typeId: MatchesHiveTypes.team1Score)
class Team1Score {
  @HiveField(Team1ScoreFields.inngs1)
  final Inngs1? inngs1;

  Team1Score({this.inngs1});

  Team1Score.fromJson(DataMap json)
      : inngs1 =
            json['inngs1'] != null ? Inngs1.fromJson(json['inngs1']) : null;
}

@HiveType(typeId: MatchesHiveTypes.inngs1)
class Inngs1 {
  @HiveField(Inngs1Fields.inningsId)
  final int? inningsId;
  @HiveField(Inngs1Fields.runs)
  final int? runs;
  @HiveField(Inngs1Fields.wickets)
  final int? wickets;
  @HiveField(Inngs1Fields.overs)
  final double? overs;

  Inngs1({this.inningsId, this.runs, this.wickets, this.overs});

  Inngs1.fromJson(DataMap json)
      : inningsId = json['inningsId'] ?? 0,
        runs = json['runs'] ?? 0,
        wickets = json['wickets'] ?? 0,
        overs = json['overs'] ?? 0.0;
}

@HiveType(typeId: MatchesHiveTypes.adDetail)
class AdDetail {
  @HiveField(AdDetailFields.name)
  final String? name;
  @HiveField(AdDetailFields.layout)
  final String? layout;
  @HiveField(AdDetailFields.position)
  final int? position;

  AdDetail({this.name, this.layout, this.position});

  AdDetail.fromJson(DataMap json)
      : name = json['name'] ?? "",
        layout = json['layout'] ?? "",
        position = json['position'] ?? 0;
}

@HiveType(typeId: MatchesHiveTypes.filters)
class Filters extends HiveObject {
  @HiveField(FiltersFields.matchType)
  final List<String>? matchType;

  Filters({this.matchType});

  Filters.fromJson(DataMap json) : matchType = json['matchType'].cast<String>();
}

@HiveType(typeId: MatchesHiveTypes.appIndex)
class AppIndex {
  @HiveField(AppIndexFields.seoTitle)
  final String? seoTitle;
  @HiveField(AppIndexFields.webURL)
  final String? webURL;

  AppIndex({this.seoTitle, this.webURL});

  AppIndex.fromJson(DataMap json)
      : seoTitle = json['seoTitle'] ?? "",
        webURL = json['webURL'] ?? "";
}
