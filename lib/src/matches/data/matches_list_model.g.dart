// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MatchesListModelAdapter extends TypeAdapter<MatchesListModel> {
  @override
  final int typeId = 0;

  @override
  MatchesListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatchesListModel(
      typeMatches: fields[0] as dynamic,
      filters: fields[1] as dynamic,
      appIndex: fields[2] as dynamic,
      responseLastUpdated: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, MatchesListModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.typeMatches)
      ..writeByte(1)
      ..write(obj.filters)
      ..writeByte(2)
      ..write(obj.appIndex)
      ..writeByte(3)
      ..write(obj.responseLastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchesListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TypeMatchesAdapter extends TypeAdapter<TypeMatches> {
  @override
  final int typeId = 1;

  @override
  TypeMatches read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypeMatches(
      matchType: fields[0] as dynamic,
      seriesMatches: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, TypeMatches obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.matchType)
      ..writeByte(1)
      ..write(obj.seriesMatches);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeMatchesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeriesMatchesAdapter extends TypeAdapter<SeriesMatches> {
  @override
  final int typeId = 2;

  @override
  SeriesMatches read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeriesMatches(
      seriesAdWrapper: fields[0] as dynamic,
      adDetail: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, SeriesMatches obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.seriesAdWrapper)
      ..writeByte(1)
      ..write(obj.adDetail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesMatchesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeriesAdWrapperAdapter extends TypeAdapter<SeriesAdWrapper> {
  @override
  final int typeId = 3;

  @override
  SeriesAdWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeriesAdWrapper(
      seriesId: fields[0] as dynamic,
      seriesName: fields[1] as dynamic,
      matches: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, SeriesAdWrapper obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.seriesId)
      ..writeByte(1)
      ..write(obj.seriesName)
      ..writeByte(2)
      ..write(obj.matches);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesAdWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MatchesAdapter extends TypeAdapter<Matches> {
  @override
  final int typeId = 4;

  @override
  Matches read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Matches(
      matchInfo: fields[0] as dynamic,
      matchScore: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Matches obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.matchInfo)
      ..writeByte(1)
      ..write(obj.matchScore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MatchInfoAdapter extends TypeAdapter<MatchInfo> {
  @override
  final int typeId = 5;

  @override
  MatchInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatchInfo(
      matchId: fields[0] as dynamic,
      seriesId: fields[1] as dynamic,
      seriesName: fields[2] as dynamic,
      matchDesc: fields[3] as dynamic,
      matchFormat: fields[4] as dynamic,
      startDate: fields[5] as dynamic,
      endDate: fields[6] as dynamic,
      state: fields[7] as dynamic,
      status: fields[8] as dynamic,
      team1: fields[9] as dynamic,
      team2: fields[10] as dynamic,
      venueInfo: fields[12] as dynamic,
      currBatTeamId: fields[13] as dynamic,
      seriesStartDt: fields[14] as dynamic,
      seriesEndDt: fields[15] as dynamic,
      isTimeAnnounced: fields[16] as dynamic,
      stateTitle: fields[17] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, MatchInfo obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.matchId)
      ..writeByte(1)
      ..write(obj.seriesId)
      ..writeByte(2)
      ..write(obj.seriesName)
      ..writeByte(3)
      ..write(obj.matchDesc)
      ..writeByte(4)
      ..write(obj.matchFormat)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.endDate)
      ..writeByte(7)
      ..write(obj.state)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.team1)
      ..writeByte(10)
      ..write(obj.team2)
      ..writeByte(12)
      ..write(obj.venueInfo)
      ..writeByte(13)
      ..write(obj.currBatTeamId)
      ..writeByte(14)
      ..write(obj.seriesStartDt)
      ..writeByte(15)
      ..write(obj.seriesEndDt)
      ..writeByte(16)
      ..write(obj.isTimeAnnounced)
      ..writeByte(17)
      ..write(obj.stateTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Team1Adapter extends TypeAdapter<Team1> {
  @override
  final int typeId = 6;

  @override
  Team1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Team1(
      teamId: fields[0] as dynamic,
      teamName: fields[1] as dynamic,
      teamSName: fields[2] as dynamic,
      imageId: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Team1 obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.teamId)
      ..writeByte(1)
      ..write(obj.teamName)
      ..writeByte(2)
      ..write(obj.teamSName)
      ..writeByte(3)
      ..write(obj.imageId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Team1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VenueInfoAdapter extends TypeAdapter<VenueInfo> {
  @override
  final int typeId = 7;

  @override
  VenueInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VenueInfo(
      id: fields[0] as dynamic,
      ground: fields[1] as dynamic,
      city: fields[2] as dynamic,
      timezone: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, VenueInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ground)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.timezone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VenueInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MatchScoreAdapter extends TypeAdapter<MatchScore> {
  @override
  final int typeId = 8;

  @override
  MatchScore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatchScore(
      team1Score: fields[0] as dynamic,
      team2Score: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, MatchScore obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.team1Score)
      ..writeByte(1)
      ..write(obj.team2Score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchScoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Team1ScoreAdapter extends TypeAdapter<Team1Score> {
  @override
  final int typeId = 9;

  @override
  Team1Score read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Team1Score(
      inngs1: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Team1Score obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.inngs1);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Team1ScoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Inngs1Adapter extends TypeAdapter<Inngs1> {
  @override
  final int typeId = 10;

  @override
  Inngs1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Inngs1(
      inningsId: fields[0] as dynamic,
      runs: fields[1] as dynamic,
      wickets: fields[2] as dynamic,
      overs: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Inngs1 obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.inningsId)
      ..writeByte(1)
      ..write(obj.runs)
      ..writeByte(2)
      ..write(obj.wickets)
      ..writeByte(3)
      ..write(obj.overs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Inngs1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AdDetailAdapter extends TypeAdapter<AdDetail> {
  @override
  final int typeId = 11;

  @override
  AdDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdDetail(
      name: fields[0] as dynamic,
      layout: fields[1] as dynamic,
      position: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, AdDetail obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.layout)
      ..writeByte(2)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FiltersAdapter extends TypeAdapter<Filters> {
  @override
  final int typeId = 12;

  @override
  Filters read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Filters(
      matchType: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Filters obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.matchType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FiltersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppIndexAdapter extends TypeAdapter<AppIndex> {
  @override
  final int typeId = 13;

  @override
  AppIndex read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppIndex(
      seoTitle: fields[0] as dynamic,
      webURL: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, AppIndex obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.seoTitle)
      ..writeByte(1)
      ..write(obj.webURL);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppIndexAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
