import 'package:hive/hive.dart';

import '../../../core/utils/typedefs.dart';
import 'fields/matches_hive_types.dart';
import 'fields/matches_list_main_fields.dart';
part 'matches_list_model.g.dart';

@HiveType(typeId: MatchesHiveTypes.matchesList)
class MatchesListModel extends HiveObject {
  @HiveField(MatchesListMainFields.typeMatches)
  List<TypeMatches>? typeMatches;
  @HiveField(MatchesListMainFields.filters)
  Filters? filters;
  @HiveField(MatchesListMainFields.appIndex)
  AppIndex? appIndex;
  @HiveField(MatchesListMainFields.responseLastUpdated)
  String? responseLastUpdated;

  MatchesListModel({typeMatches, filters, appIndex, responseLastUpdated});

  MatchesListModel.fromJson(DataMap json) {
    if (json['typeMatches'] != null) {
      typeMatches = <TypeMatches>[];
      json['typeMatches'].forEach((v) {
        typeMatches!.add(TypeMatches.fromJson(v));
      });
    }
    filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;
    appIndex =
        json['appIndex'] != null ? AppIndex.fromJson(json['appIndex']) : null;
    responseLastUpdated = json['responseLastUpdated'];
  }

  DataMap toJson() {
    final DataMap data = <String, dynamic>{};
    if (typeMatches != null) {
      data['typeMatches'] = typeMatches!.map((v) => v.toJson()).toList();
    }
    if (filters != null) {
      data['filters'] = filters!.toJson();
    }
    if (appIndex != null) {
      data['appIndex'] = appIndex!.toJson();
    }
    data['responseLastUpdated'] = responseLastUpdated;
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.typeMatches)
class TypeMatches extends HiveObject {
  @HiveField(TypeMatchesFields.matchType)
  String? matchType;
  @HiveField(TypeMatchesFields.seriesMatches)
  List<SeriesMatches>? seriesMatches;

  TypeMatches({matchType, seriesMatches});

  TypeMatches.fromJson(DataMap json) {
    matchType = json['matchType'];
    if (json['seriesMatches'] != null) {
      seriesMatches = <SeriesMatches>[];
      json['seriesMatches'].forEach((v) {
        seriesMatches!.add(SeriesMatches.fromJson(v));
      });
    }
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    data['matchType'] = matchType;
    if (seriesMatches != null) {
      data['seriesMatches'] = seriesMatches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.seriesMatches)
class SeriesMatches extends HiveObject {
  @HiveField(SeriesMatchesFields.seriesAdWrapper)
  SeriesAdWrapper? seriesAdWrapper;
  @HiveField(SeriesMatchesFields.adDetail)
  AdDetail? adDetail;

  SeriesMatches({seriesAdWrapper, adDetail});

  SeriesMatches.fromJson(DataMap json) {
    seriesAdWrapper = json['seriesAdWrapper'] != null
        ? SeriesAdWrapper.fromJson(json['seriesAdWrapper'])
        : null;
    adDetail =
        json['adDetail'] != null ? AdDetail.fromJson(json['adDetail']) : null;
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    if (seriesAdWrapper != null) {
      data['seriesAdWrapper'] = seriesAdWrapper!.toJson();
    }
    if (adDetail != null) {
      data['adDetail'] = adDetail!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.seriesAdWrapper)
class SeriesAdWrapper extends HiveObject {
  @HiveField(SeriesAdWrapperFields.seriesId)
  int? seriesId;
  @HiveField(SeriesAdWrapperFields.seriesName)
  String? seriesName;
  @HiveField(SeriesAdWrapperFields.matches)
  List<Matches>? matches;

  SeriesAdWrapper({seriesId, seriesName, matches});

  SeriesAdWrapper.fromJson(DataMap json) {
    seriesId = json['seriesId'];
    seriesName = json['seriesName'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    data['seriesId'] = seriesId;
    data['seriesName'] = seriesName;
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.matches)
class Matches extends HiveObject {
  @HiveField(MatchesFields.matchInfo)
  MatchInfo? matchInfo;
  @HiveField(MatchesFields.matchScore)
  MatchScore? matchScore;

  Matches({matchInfo, matchScore});

  Matches.fromJson(DataMap json) {
    matchInfo = json['matchInfo'] != null
        ? MatchInfo.fromJson(json['matchInfo'])
        : null;
    matchScore = json['matchScore'] != null
        ? MatchScore.fromJson(json['matchScore'])
        : null;
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    if (matchInfo != null) {
      data['matchInfo'] = matchInfo!.toJson();
    }
    if (matchScore != null) {
      data['matchScore'] = matchScore!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.matchInfo)
class MatchInfo extends HiveObject {
  @HiveField(MatchInfoFields.matchId)
  int? matchId;
  @HiveField(MatchInfoFields.seriesId)
  int? seriesId;
  @HiveField(MatchInfoFields.seriesName)
  String? seriesName;
  @HiveField(MatchInfoFields.matchDesc)
  String? matchDesc;
  @HiveField(MatchInfoFields.matchFormat)
  String? matchFormat;
  @HiveField(MatchInfoFields.startDate)
  String? startDate;
  @HiveField(MatchInfoFields.endDate)
  String? endDate;
  @HiveField(MatchInfoFields.state)
  String? state;
  @HiveField(MatchInfoFields.status)
  String? status;
  @HiveField(MatchInfoFields.team1)
  Team1? team1;
  @HiveField(MatchInfoFields.team2)
  Team1? team2;
  @HiveField(MatchInfoFields.venueInfo)
  VenueInfo? venueInfo;
  @HiveField(MatchInfoFields.currBatTeamId)
  int? currBatTeamId;
  @HiveField(MatchInfoFields.seriesStartDt)
  String? seriesStartDt;
  @HiveField(MatchInfoFields.seriesEndDt)
  String? seriesEndDt;
  @HiveField(MatchInfoFields.isTimeAnnounced)
  bool? isTimeAnnounced;
  @HiveField(MatchInfoFields.stateTitle)
  String? stateTitle;

  MatchInfo(
      {matchId,
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
      stateTitle});

  MatchInfo.fromJson(DataMap json) {
    matchId = json['matchId'];
    seriesId = json['seriesId'];
    seriesName = json['seriesName'];
    matchDesc = json['matchDesc'];
    matchFormat = json['matchFormat'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    state = json['state'];
    status = json['status'];
    team1 = json['team1'] != null ? Team1.fromJson(json['team1']) : null;
    team2 = json['team2'] != null ? Team1.fromJson(json['team2']) : null;
    venueInfo = json['venueInfo'] != null
        ? VenueInfo.fromJson(json['venueInfo'])
        : null;
    currBatTeamId = json['currBatTeamId'];
    seriesStartDt = json['seriesStartDt'];
    seriesEndDt = json['seriesEndDt'];
    isTimeAnnounced = json['isTimeAnnounced'];
    stateTitle = json['stateTitle'];
  }

  DataMap toJson() {
    final DataMap data = <String, dynamic>{};
    data['matchId'] = matchId;
    data['seriesId'] = seriesId;
    data['seriesName'] = seriesName;
    data['matchDesc'] = matchDesc;
    data['matchFormat'] = matchFormat;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['state'] = state;
    data['status'] = status;
    if (team1 != null) {
      data['team1'] = team1!.toJson();
    }
    if (team2 != null) {
      data['team2'] = team2!.toJson();
    }
    if (venueInfo != null) {
      data['venueInfo'] = venueInfo!.toJson();
    }
    data['currBatTeamId'] = currBatTeamId;
    data['seriesStartDt'] = seriesStartDt;
    data['seriesEndDt'] = seriesEndDt;
    data['isTimeAnnounced'] = isTimeAnnounced;
    data['stateTitle'] = stateTitle;
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.team1)
class Team1 extends HiveObject {
  @HiveField(Team1Fields.teamId)
  int? teamId;
  @HiveField(Team1Fields.teamName)
  String? teamName;
  @HiveField(Team1Fields.teamSName)
  String? teamSName;
  @HiveField(Team1Fields.imageId)
  int? imageId;

  Team1({teamId, teamName, teamSName, imageId});

  Team1.fromJson(DataMap json) {
    teamId = json['teamId'];
    teamName = json['teamName'];
    teamSName = json['teamSName'];
    imageId = json['imageId'];
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    data['teamId'] = teamId;
    data['teamName'] = teamName;
    data['teamSName'] = teamSName;
    data['imageId'] = imageId;
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.venueInfo)
class VenueInfo extends HiveObject {
  @HiveField(VenueInfoFields.id)
  int? id;
  @HiveField(VenueInfoFields.ground)
  String? ground;
  @HiveField(VenueInfoFields.city)
  String? city;
  @HiveField(VenueInfoFields.timezone)
  String? timezone;

  VenueInfo({id, ground, city, timezone});

  VenueInfo.fromJson(DataMap json) {
    id = json['id'];
    ground = json['ground'];
    city = json['city'];
    timezone = json['timezone'];
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    data['id'] = id;
    data['ground'] = ground;
    data['city'] = city;
    data['timezone'] = timezone;
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.matchScore)
class MatchScore extends HiveObject {
  @HiveField(MatchScoreFields.team1Score)
  Team1Score? team1Score;
  @HiveField(MatchScoreFields.team2Score)
  Team1Score? team2Score;

  MatchScore({team1Score, team2Score});

  MatchScore.fromJson(DataMap json) {
    team1Score = json['team1Score'] != null
        ? Team1Score.fromJson(json['team1Score'])
        : null;
    team2Score = json['team2Score'] != null
        ? Team1Score.fromJson(json['team2Score'])
        : null;
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    if (team1Score != null) {
      data['team1Score'] = team1Score!.toJson();
    }
    if (team2Score != null) {
      data['team2Score'] = team2Score!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.team1Score)
class Team1Score extends HiveObject {
  @HiveField(Team1ScoreFields.inngs1)
  Inngs1? inngs1;

  Team1Score({inngs1});

  Team1Score.fromJson(DataMap json) {
    inngs1 = json['inngs1'] != null ? Inngs1.fromJson(json['inngs1']) : null;
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    if (inngs1 != null) {
      data['inngs1'] = inngs1!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.inngs1)
class Inngs1 extends HiveObject {
  @HiveField(Inngs1Fields.inningsId)
  int? inningsId;
  @HiveField(Inngs1Fields.runs)
  int? runs;
  @HiveField(Inngs1Fields.wickets)
  int? wickets;
  @HiveField(Inngs1Fields.overs)
  double? overs;

  Inngs1({inningsId, runs, wickets, overs});

  Inngs1.fromJson(DataMap json) {
    inningsId = json['inningsId'];
    runs = json['runs'];
    wickets = json['wickets'];
    overs = json['overs'];
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    data['inningsId'] = inningsId;
    data['runs'] = runs;
    data['wickets'] = wickets;
    data['overs'] = overs;
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.adDetail)
class AdDetail extends HiveObject {
  @HiveField(AdDetailFields.name)
  String? name;
  @HiveField(AdDetailFields.layout)
  String? layout;
  @HiveField(AdDetailFields.position)
  int? position;

  AdDetail({name, layout, position});

  AdDetail.fromJson(DataMap json) {
    name = json['name'];
    layout = json['layout'];
    position = json['position'];
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    data['name'] = name;
    data['layout'] = layout;
    data['position'] = position;
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.filters)
class Filters extends HiveObject {
  @HiveField(FiltersFields.matchType)
  List<String>? matchType;

  Filters({matchType});

  Filters.fromJson(DataMap json) {
    matchType = json['matchType'].cast<String>();
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    data['matchType'] = matchType;
    return data;
  }
}

@HiveType(typeId: MatchesHiveTypes.appIndex)
class AppIndex extends HiveObject {
  @HiveField(AppIndexFields.seoTitle)
  String? seoTitle;
  @HiveField(AppIndexFields.webURL)
  String? webURL;

  AppIndex({seoTitle, webURL});

  AppIndex.fromJson(DataMap json) {
    seoTitle = json['seoTitle'];
    webURL = json['webURL'];
  }

  DataMap toJson() {
    final DataMap data = DataMap();
    data['seoTitle'] = seoTitle;
    data['webURL'] = webURL;
    return data;
  }
}
