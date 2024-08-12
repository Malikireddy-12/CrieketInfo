class MatchesListMainFields {
  static const typeMatches = 0;
  static const filters = 1;
  static const appIndex = 2;
  static const responseLastUpdated = 3;
}

class TypeMatchesFields {
  static const matchType = 0;
  static const seriesMatches = 1;
}

class SeriesMatchesFields {
  static const seriesAdWrapper = 0;
  static const adDetail = 1;
}

class SeriesAdWrapperFields {
  static const seriesId = 0;
  static const seriesName = 1;
  static const matches = 2;
}

class MatchesFields {
  static const matchInfo = 0;
  static const matchScore = 1;
}

class MatchInfoFields {
  static const matchId = 0;
  static const seriesId = 1;
  static const seriesName = 2;
  static const matchDesc = 3;
  static const matchFormat = 4;
  static const startDate = 5;
  static const endDate = 6;
  static const state = 7;
  static const status = 8;
  static const team1 = 9;
  static const team2 = 10;
  static const venueInfo = 12;
  static const currBatTeamId = 13;
  static const seriesStartDt = 14;
  static const seriesEndDt = 15;
  static const isTimeAnnounced = 16;
  static const stateTitle = 17;
}

class Team1Fields {
  static const teamId = 0;
  static const teamName = 1;
  static const teamSName = 2;
  static const imageId = 3;
}

class VenueInfoFields {
  static const id = 0;
  static const ground = 1;
  static const city = 2;
  static const timezone = 3;
}

class MatchScoreFields {
  static const team1Score = 0;
  static const team2Score = 1;
}

class Team1ScoreFields {
  static const inngs1 = 0;
}

class Inngs1Fields {
  static const inningsId = 0;
  static const runs = 1;
  static const wickets = 2;
  static const overs = 3;
}

class AdDetailFields {
  static const name = 0;
  static const layout = 1;
  static const position = 2;
}

class FiltersFields {
  static const matchType = 0;
}

class AppIndexFields {
  static const seoTitle = 0;
  static const webURL = 1;
}
