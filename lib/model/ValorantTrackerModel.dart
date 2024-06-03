class ValorantTrackerModel {
  ValorantTrackerModel({
    required this.data,
  });

  final ProfileTrackerData? data;

  factory ValorantTrackerModel.fromJson(Map<String, dynamic> json){
    return ValorantTrackerModel(
      data: json["data"] == null ? null : ProfileTrackerData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };

}

class ProfileTrackerData {
  ProfileTrackerData({
    required this.platformInfo,
    required this.userInfo,
    required this.metadata,
    required this.segments,
    required this.availableSegments,
    required this.expiryDate,
  });

  final PlatformInfo? platformInfo;
  final UserInfo? userInfo;
  final DataMetadata? metadata;
  final List<Segment> segments;
  final List<dynamic> availableSegments;
  final DateTime? expiryDate;

  factory ProfileTrackerData.fromJson(Map<String, dynamic> json){
    return ProfileTrackerData(
      platformInfo: json["platformInfo"] == null ? null : PlatformInfo.fromJson(json["platformInfo"]),
      userInfo: json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
      metadata: json["metadata"] == null ? null : DataMetadata.fromJson(json["metadata"]),
      segments: json["segments"] == null ? [] : List<Segment>.from(json["segments"]!.map((x) => Segment.fromJson(x))),
      availableSegments: json["availableSegments"] == null ? [] : List<dynamic>.from(json["availableSegments"]!.map((x) => x)),
      expiryDate: DateTime.tryParse(json["expiryDate"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "platformInfo": platformInfo?.toJson(),
    "userInfo": userInfo?.toJson(),
    "metadata": metadata?.toJson(),
    "segments": segments.map((x) => x?.toJson()).toList(),
    "availableSegments": availableSegments.map((x) => x).toList(),
    "expiryDate": expiryDate?.toIso8601String(),
  };

}

class DataMetadata {
  DataMetadata({
    required this.activeShard,
    required this.schema,
    required this.privacy,
    required this.defaultPlaylist,
    required this.defaultSeason,
    required this.premierRosterId,
    required this.premierCrests,
    required this.accountLevel,
  });

  final String? activeShard;
  final String? schema;
  final String? privacy;
  final String? defaultPlaylist;
  final String? defaultSeason;
  final dynamic premierRosterId;
  final dynamic premierCrests;
  final num? accountLevel;

  factory DataMetadata.fromJson(Map<String, dynamic> json){
    return DataMetadata(
      activeShard: json["activeShard"],
      schema: json["schema"],
      privacy: json["privacy"],
      defaultPlaylist: json["defaultPlaylist"],
      defaultSeason: json["defaultSeason"],
      premierRosterId: json["premierRosterId"],
      premierCrests: json["premierCrests"],
      accountLevel: json["accountLevel"],
    );
  }

  Map<String, dynamic> toJson() => {
    "activeShard": activeShard,
    "schema": schema,
    "privacy": privacy,
    "defaultPlaylist": defaultPlaylist,
    "defaultSeason": defaultSeason,
    "premierRosterId": premierRosterId,
    "premierCrests": premierCrests,
    "accountLevel": accountLevel,
  };

}

class PlatformInfo {
  PlatformInfo({
    required this.platformSlug,
    required this.platformUserId,
    required this.platformUserHandle,
    required this.platformUserIdentifier,
    required this.avatarUrl,
    required this.additionalParameters,
  });

  final String? platformSlug;
  final String? platformUserId;
  final String? platformUserHandle;
  final String? platformUserIdentifier;
  final String? avatarUrl;
  final dynamic additionalParameters;

  factory PlatformInfo.fromJson(Map<String, dynamic> json){
    return PlatformInfo(
      platformSlug: json["platformSlug"],
      platformUserId: json["platformUserId"],
      platformUserHandle: json["platformUserHandle"],
      platformUserIdentifier: json["platformUserIdentifier"],
      avatarUrl: json["avatarUrl"],
      additionalParameters: json["additionalParameters"],
    );
  }

  Map<String, dynamic> toJson() => {
    "platformSlug": platformSlug,
    "platformUserId": platformUserId,
    "platformUserHandle": platformUserHandle,
    "platformUserIdentifier": platformUserIdentifier,
    "avatarUrl": avatarUrl,
    "additionalParameters": additionalParameters,
  };

}

class Segment {
  Segment({
    required this.type,
    required this.attributes,
    required this.metadata,
    required this.expiryDate,
    required this.stats,
  });

  final String? type;
  final Attributes? attributes;
  final SegmentMetadata? metadata;
  final DateTime? expiryDate;
  final Stats? stats;

  factory Segment.fromJson(Map<String, dynamic> json){
    return Segment(
      type: json["type"],
      attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
      metadata: json["metadata"] == null ? null : SegmentMetadata.fromJson(json["metadata"]),
      expiryDate: DateTime.tryParse(json["expiryDate"] ?? ""),
      stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "type": type,
    "attributes": attributes?.toJson(),
    "metadata": metadata?.toJson(),
    "expiryDate": expiryDate?.toIso8601String(),
    "stats": stats?.toJson(),
  };

}

class Attributes {
  Attributes({
    required this.seasonId,
    required this.playlist,
    required this.key,
    required this.mapKey,
  });

  final String? seasonId;
  final String? playlist;
  final String? key;
  final String? mapKey;

  factory Attributes.fromJson(Map<String, dynamic> json){
    return Attributes(
      seasonId: json["seasonId"],
      playlist: json["playlist"],
      key: json["key"],
      mapKey: json["mapKey"],
    );
  }

  Map<String, dynamic> toJson() => {
    "seasonId": seasonId,
    "playlist": playlist,
    "key": key,
    "mapKey": mapKey,
  };

}

class SegmentMetadata {
  SegmentMetadata({
    required this.name,
    required this.shortName,
    required this.playlistName,
    required this.startTime,
    required this.endTime,
    required this.schema,
    required this.imageUrl,
    required this.role,
    required this.color,
    required this.abilities,
  });

  final String? name;
  final String? shortName;
  final String? playlistName;
  final DateTime? startTime;
  final DateTime? endTime;
  final String? schema;
  final String? imageUrl;
  final String? role;
  final String? color;
  final Abilities? abilities;

  factory SegmentMetadata.fromJson(Map<String, dynamic> json){
    return SegmentMetadata(
      name: json["name"],
      shortName: json["shortName"],
      playlistName: json["playlistName"],
      startTime: DateTime.tryParse(json["startTime"] ?? ""),
      endTime: DateTime.tryParse(json["endTime"] ?? ""),
      schema: json["schema"],
      imageUrl: json["imageUrl"],
      role: json["role"],
      color: json["color"],
      abilities: json["abilities"] == null ? null : Abilities.fromJson(json["abilities"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "shortName": shortName,
    "playlistName": playlistName,
    "startTime": startTime?.toIso8601String(),
    "endTime": endTime?.toIso8601String(),
    "schema": schema,
    "imageUrl": imageUrl,
    "role": role,
    "color": color,
    "abilities": abilities?.toJson(),
  };

}

class Abilities {
  Abilities({
    required this.ability1,
    required this.ability2,
    required this.grenade,
    required this.ultimate,
    required this.passive,
  });

  final Ability1? ability1;
  final Ability1? ability2;
  final Ability1? grenade;
  final Ability1? ultimate;
  final Ability1? passive;

  factory Abilities.fromJson(Map<String, dynamic> json){
    return Abilities(
      ability1: json["Ability1"] == null ? null : Ability1.fromJson(json["Ability1"]),
      ability2: json["Ability2"] == null ? null : Ability1.fromJson(json["Ability2"]),
      grenade: json["Grenade"] == null ? null : Ability1.fromJson(json["Grenade"]),
      ultimate: json["Ultimate"] == null ? null : Ability1.fromJson(json["Ultimate"]),
      passive: json["Passive"] == null ? null : Ability1.fromJson(json["Passive"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "Ability1": ability1?.toJson(),
    "Ability2": ability2?.toJson(),
    "Grenade": grenade?.toJson(),
    "Ultimate": ultimate?.toJson(),
    "Passive": passive?.toJson(),
  };

}

class Ability1 {
  Ability1({
    required this.name,
    required this.imageUrl,
  });

  final String? name;
  final String? imageUrl;

  factory Ability1.fromJson(Map<String, dynamic> json){
    return Ability1(
      name: json["name"],
      imageUrl: json["imageUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageUrl": imageUrl,
  };

}

class Stats {
  Stats({
    required this.matchesPlayed,
    required this.matchesWon,
    required this.matchesLost,
    required this.matchesTied,
    required this.matchesWinPct,
    required this.matchesDisconnected,
    required this.matchesDuration,
    required this.timePlayed,
    required this.mVPs,
    required this.roundsPlayed,
    required this.roundsWon,
    required this.roundsLost,
    required this.roundsWinPct,
    required this.roundsDuration,
    required this.score,
    required this.scorePerMatch,
    required this.scorePerRound,
    required this.kills,
    required this.killsPerRound,
    required this.killsPerMatch,
    required this.deaths,
    required this.deathsPerRound,
    required this.deathsPerMatch,
    required this.assists,
    required this.assistsPerRound,
    required this.assistsPerMatch,
    required this.kDRatio,
    required this.kDaRatio,
    required this.kAdRatio,
    required this.damage,
    required this.damageDelta,
    required this.damageDeltaPerRound,
    required this.damagePerRound,
    required this.damagePerMatch,
    required this.damagePerMinute,
    required this.damageReceived,
    required this.headshots,
    required this.headshotsPerRound,
    required this.headshotsPercentage,
    required this.grenadeCasts,
    required this.grenadeCastsPerRound,
    required this.grenadeCastsPerMatch,
    required this.ability1Casts,
    required this.ability1CastsPerRound,
    required this.ability1CastsPerMatch,
    required this.ability2Casts,
    required this.ability2CastsPerRound,
    required this.ability2CastsPerMatch,
    required this.ultimateCasts,
    required this.ultimateCastsPerRound,
    required this.ultimateCastsPerMatch,
    required this.dealtHeadshots,
    required this.dealtBodyshots,
    required this.dealtLegshots,
    required this.receivedHeadshots,
    required this.receivedBodyshots,
    required this.receivedLegshots,
    required this.econRating,
    required this.econRatingPerMatch,
    required this.econRatingPerRound,
    required this.suicides,
    required this.firstBloods,
    required this.firstBloodsPerRound,
    required this.firstBloodsPerMatch,
    required this.firstDeaths,
    required this.firstDeathsPerRound,
    required this.lastDeaths,
    required this.survived,
    required this.traded,
    required this.kAst,
    required this.mostKillsInMatch,
    required this.flawless,
    required this.thrifty,
    required this.aces,
    required this.teamAces,
    required this.clutches,
    required this.clutchesPercentage,
    required this.clutchesLost,
    required this.clutches1V1,
    required this.clutches1V2,
    required this.clutches1V3,
    required this.clutches1V4,
    required this.clutches1V5,
    required this.clutchesLost1V1,
    required this.clutchesLost1V2,
    required this.clutchesLost1V3,
    required this.clutchesLost1V4,
    required this.clutchesLost1V5,
    required this.kills1K,
    required this.kills2K,
    required this.kills3K,
    required this.kills4K,
    required this.kills5K,
    required this.kills6K,
    required this.esr,
    required this.plants,
    required this.plantsPerMatch,
    required this.plantsPerRound,
    required this.attackKills,
    required this.attackKillsPerRound,
    required this.attackDeaths,
    required this.attackKdRatio,
    required this.attackAssists,
    required this.attackAssistsPerRound,
    required this.attackRoundsWon,
    required this.attackRoundsLost,
    required this.attackRoundsPlayed,
    required this.attackRoundsWinPct,
    required this.attackScore,
    required this.attackScorePerRound,
    required this.attackDamage,
    required this.attackDamagePerRound,
    required this.attackHeadshots,
    required this.attackTraded,
    required this.attackSurvived,
    required this.attackFirstBloods,
    required this.attackFirstBloodsPerRound,
    required this.attackFirstDeaths,
    required this.attackFirstDeathsPerRound,
    required this.attackKast,
    required this.defuses,
    required this.defusesPerMatch,
    required this.defusesPerRound,
    required this.defenseKills,
    required this.defenseKillsPerRound,
    required this.defenseDeaths,
    required this.defenseKdRatio,
    required this.defenseAssists,
    required this.defenseAssistsPerRound,
    required this.defenseRoundsWon,
    required this.defenseRoundsLost,
    required this.defenseRoundsPlayed,
    required this.defenseRoundsWinPct,
    required this.defenseScore,
    required this.defenseScorePerRound,
    required this.defenseDamage,
    required this.defenseDamagePerRound,
    required this.defenseHeadshots,
    required this.defenseTraded,
    required this.defenseSurvived,
    required this.defenseFirstBloods,
    required this.defenseFirstBloodsPerRound,
    required this.defenseFirstDeaths,
    required this.defenseFirstDeathsPerRound,
    required this.defenseKast,
    required this.rank,
    required this.trnPerformanceScore,
    required this.peakRank,
    required this.peakRating,
    required this.ability1Kills,
    required this.ability1KillsPerMatch,
    required this.ability2Kills,
    required this.ability2KillsPerMatch,
    required this.grenadeKills,
    required this.grenadeKillsPerMatch,
    required this.primaryKills,
    required this.primaryKillsPerMatch,
    required this.ultimateKills,
    required this.ultimateKillsPerMatch,
    required this.pickRate,
  });

  final Ability1Casts? matchesPlayed;
  final Ability1Casts? matchesWon;
  final Ability1Casts? matchesLost;
  final Ability1Casts? matchesTied;
  final Ability1Casts? matchesWinPct;
  final Ability1Casts? matchesDisconnected;
  final Ability1Casts? matchesDuration;
  final Ability1Casts? timePlayed;
  final MVPs? mVPs;
  final Ability1Casts? roundsPlayed;
  final Ability1Casts? roundsWon;
  final Ability1Casts? roundsLost;
  final Ability1Casts? roundsWinPct;
  final Ability1Casts? roundsDuration;
  final Ability1Casts? score;
  final Ability1Casts? scorePerMatch;
  final Ability1Casts? scorePerRound;
  final Ability1Casts? kills;
  final Ability1Casts? killsPerRound;
  final Ability1Casts? killsPerMatch;
  final Ability1Casts? deaths;
  final Ability1Casts? deathsPerRound;
  final Ability1Casts? deathsPerMatch;
  final Ability1Casts? assists;
  final Ability1Casts? assistsPerRound;
  final Ability1Casts? assistsPerMatch;
  final Ability1Casts? kDRatio;
  final Ability1Casts? kDaRatio;
  final Ability1Casts? kAdRatio;
  final Ability1Casts? damage;
  final Ability1Casts? damageDelta;
  final Ability1Casts? damageDeltaPerRound;
  final Ability1Casts? damagePerRound;
  final Ability1Casts? damagePerMatch;
  final Ability1Casts? damagePerMinute;
  final Ability1Casts? damageReceived;
  final Ability1Casts? headshots;
  final Ability1Casts? headshotsPerRound;
  final Ability1Casts? headshotsPercentage;
  final Ability1Casts? grenadeCasts;
  final Ability1Casts? grenadeCastsPerRound;
  final Ability1Casts? grenadeCastsPerMatch;
  final Ability1Casts? ability1Casts;
  final Ability1Casts? ability1CastsPerRound;
  final Ability1Casts? ability1CastsPerMatch;
  final Ability1Casts? ability2Casts;
  final Ability1Casts? ability2CastsPerRound;
  final Ability1Casts? ability2CastsPerMatch;
  final Ability1Casts? ultimateCasts;
  final Ability1Casts? ultimateCastsPerRound;
  final Ability1Casts? ultimateCastsPerMatch;
  final Ability1Casts? dealtHeadshots;
  final Ability1Casts? dealtBodyshots;
  final Ability1Casts? dealtLegshots;
  final Ability1Casts? receivedHeadshots;
  final Ability1Casts? receivedBodyshots;
  final Ability1Casts? receivedLegshots;
  final Ability1Casts? econRating;
  final Ability1Casts? econRatingPerMatch;
  final Ability1Casts? econRatingPerRound;
  final Ability1Casts? suicides;
  final Ability1Casts? firstBloods;
  final Ability1Casts? firstBloodsPerRound;
  final Ability1Casts? firstBloodsPerMatch;
  final Ability1Casts? firstDeaths;
  final Ability1Casts? firstDeathsPerRound;
  final Ability1Casts? lastDeaths;
  final Ability1Casts? survived;
  final Ability1Casts? traded;
  final Ability1Casts? kAst;
  final Ability1Casts? mostKillsInMatch;
  final Ability1Casts? flawless;
  final Ability1Casts? thrifty;
  final Ability1Casts? aces;
  final Ability1Casts? teamAces;
  final Ability1Casts? clutches;
  final Ability1Casts? clutchesPercentage;
  final Ability1Casts? clutchesLost;
  final Ability1Casts? clutches1V1;
  final Ability1Casts? clutches1V2;
  final Ability1Casts? clutches1V3;
  final Ability1Casts? clutches1V4;
  final Ability1Casts? clutches1V5;
  final Ability1Casts? clutchesLost1V1;
  final Ability1Casts? clutchesLost1V2;
  final Ability1Casts? clutchesLost1V3;
  final Ability1Casts? clutchesLost1V4;
  final Ability1Casts? clutchesLost1V5;
  final Ability1Casts? kills1K;
  final Ability1Casts? kills2K;
  final Ability1Casts? kills3K;
  final Ability1Casts? kills4K;
  final Ability1Casts? kills5K;
  final Ability1Casts? kills6K;
  final Ability1Casts? esr;
  final Ability1Casts? plants;
  final Ability1Casts? plantsPerMatch;
  final Ability1Casts? plantsPerRound;
  final Ability1Casts? attackKills;
  final Ability1Casts? attackKillsPerRound;
  final Ability1Casts? attackDeaths;
  final Ability1Casts? attackKdRatio;
  final Ability1Casts? attackAssists;
  final Ability1Casts? attackAssistsPerRound;
  final Ability1Casts? attackRoundsWon;
  final Ability1Casts? attackRoundsLost;
  final Ability1Casts? attackRoundsPlayed;
  final Ability1Casts? attackRoundsWinPct;
  final Ability1Casts? attackScore;
  final Ability1Casts? attackScorePerRound;
  final Ability1Casts? attackDamage;
  final Ability1Casts? attackDamagePerRound;
  final Ability1Casts? attackHeadshots;
  final Ability1Casts? attackTraded;
  final Ability1Casts? attackSurvived;
  final Ability1Casts? attackFirstBloods;
  final Ability1Casts? attackFirstBloodsPerRound;
  final Ability1Casts? attackFirstDeaths;
  final Ability1Casts? attackFirstDeathsPerRound;
  final Ability1Casts? attackKast;
  final Ability1Casts? defuses;
  final Ability1Casts? defusesPerMatch;
  final Ability1Casts? defusesPerRound;
  final Ability1Casts? defenseKills;
  final Ability1Casts? defenseKillsPerRound;
  final Ability1Casts? defenseDeaths;
  final Ability1Casts? defenseKdRatio;
  final Ability1Casts? defenseAssists;
  final Ability1Casts? defenseAssistsPerRound;
  final Ability1Casts? defenseRoundsWon;
  final Ability1Casts? defenseRoundsLost;
  final Ability1Casts? defenseRoundsPlayed;
  final Ability1Casts? defenseRoundsWinPct;
  final Ability1Casts? defenseScore;
  final Ability1Casts? defenseScorePerRound;
  final Ability1Casts? defenseDamage;
  final Ability1Casts? defenseDamagePerRound;
  final Ability1Casts? defenseHeadshots;
  final Ability1Casts? defenseTraded;
  final Ability1Casts? defenseSurvived;
  final Ability1Casts? defenseFirstBloods;
  final Ability1Casts? defenseFirstBloodsPerRound;
  final Ability1Casts? defenseFirstDeaths;
  final Ability1Casts? defenseFirstDeathsPerRound;
  final Ability1Casts? defenseKast;
  final Rank? rank;
  final TrnPerformanceScore? trnPerformanceScore;
  final PeakRa? peakRank;
  final PeakRa? peakRating;
  final Ability1Casts? ability1Kills;
  final Ability1Casts? ability1KillsPerMatch;
  final Ability1Casts? ability2Kills;
  final Ability1Casts? ability2KillsPerMatch;
  final Ability1Casts? grenadeKills;
  final Ability1Casts? grenadeKillsPerMatch;
  final Ability1Casts? primaryKills;
  final Ability1Casts? primaryKillsPerMatch;
  final Ability1Casts? ultimateKills;
  final Ability1Casts? ultimateKillsPerMatch;
  final Ability1Casts? pickRate;

  factory Stats.fromJson(Map<String, dynamic> json){
    return Stats(
      matchesPlayed: json["matchesPlayed"] == null ? null : Ability1Casts.fromJson(json["matchesPlayed"]),
      matchesWon: json["matchesWon"] == null ? null : Ability1Casts.fromJson(json["matchesWon"]),
      matchesLost: json["matchesLost"] == null ? null : Ability1Casts.fromJson(json["matchesLost"]),
      matchesTied: json["matchesTied"] == null ? null : Ability1Casts.fromJson(json["matchesTied"]),
      matchesWinPct: json["matchesWinPct"] == null ? null : Ability1Casts.fromJson(json["matchesWinPct"]),
      matchesDisconnected: json["matchesDisconnected"] == null ? null : Ability1Casts.fromJson(json["matchesDisconnected"]),
      matchesDuration: json["matchesDuration"] == null ? null : Ability1Casts.fromJson(json["matchesDuration"]),
      timePlayed: json["timePlayed"] == null ? null : Ability1Casts.fromJson(json["timePlayed"]),
      mVPs: json["mVPs"] == null ? null : MVPs.fromJson(json["mVPs"]),
      roundsPlayed: json["roundsPlayed"] == null ? null : Ability1Casts.fromJson(json["roundsPlayed"]),
      roundsWon: json["roundsWon"] == null ? null : Ability1Casts.fromJson(json["roundsWon"]),
      roundsLost: json["roundsLost"] == null ? null : Ability1Casts.fromJson(json["roundsLost"]),
      roundsWinPct: json["roundsWinPct"] == null ? null : Ability1Casts.fromJson(json["roundsWinPct"]),
      roundsDuration: json["roundsDuration"] == null ? null : Ability1Casts.fromJson(json["roundsDuration"]),
      score: json["score"] == null ? null : Ability1Casts.fromJson(json["score"]),
      scorePerMatch: json["scorePerMatch"] == null ? null : Ability1Casts.fromJson(json["scorePerMatch"]),
      scorePerRound: json["scorePerRound"] == null ? null : Ability1Casts.fromJson(json["scorePerRound"]),
      kills: json["kills"] == null ? null : Ability1Casts.fromJson(json["kills"]),
      killsPerRound: json["killsPerRound"] == null ? null : Ability1Casts.fromJson(json["killsPerRound"]),
      killsPerMatch: json["killsPerMatch"] == null ? null : Ability1Casts.fromJson(json["killsPerMatch"]),
      deaths: json["deaths"] == null ? null : Ability1Casts.fromJson(json["deaths"]),
      deathsPerRound: json["deathsPerRound"] == null ? null : Ability1Casts.fromJson(json["deathsPerRound"]),
      deathsPerMatch: json["deathsPerMatch"] == null ? null : Ability1Casts.fromJson(json["deathsPerMatch"]),
      assists: json["assists"] == null ? null : Ability1Casts.fromJson(json["assists"]),
      assistsPerRound: json["assistsPerRound"] == null ? null : Ability1Casts.fromJson(json["assistsPerRound"]),
      assistsPerMatch: json["assistsPerMatch"] == null ? null : Ability1Casts.fromJson(json["assistsPerMatch"]),
      kDRatio: json["kDRatio"] == null ? null : Ability1Casts.fromJson(json["kDRatio"]),
      kDaRatio: json["kDARatio"] == null ? null : Ability1Casts.fromJson(json["kDARatio"]),
      kAdRatio: json["kADRatio"] == null ? null : Ability1Casts.fromJson(json["kADRatio"]),
      damage: json["damage"] == null ? null : Ability1Casts.fromJson(json["damage"]),
      damageDelta: json["damageDelta"] == null ? null : Ability1Casts.fromJson(json["damageDelta"]),
      damageDeltaPerRound: json["damageDeltaPerRound"] == null ? null : Ability1Casts.fromJson(json["damageDeltaPerRound"]),
      damagePerRound: json["damagePerRound"] == null ? null : Ability1Casts.fromJson(json["damagePerRound"]),
      damagePerMatch: json["damagePerMatch"] == null ? null : Ability1Casts.fromJson(json["damagePerMatch"]),
      damagePerMinute: json["damagePerMinute"] == null ? null : Ability1Casts.fromJson(json["damagePerMinute"]),
      damageReceived: json["damageReceived"] == null ? null : Ability1Casts.fromJson(json["damageReceived"]),
      headshots: json["headshots"] == null ? null : Ability1Casts.fromJson(json["headshots"]),
      headshotsPerRound: json["headshotsPerRound"] == null ? null : Ability1Casts.fromJson(json["headshotsPerRound"]),
      headshotsPercentage: json["headshotsPercentage"] == null ? null : Ability1Casts.fromJson(json["headshotsPercentage"]),
      grenadeCasts: json["grenadeCasts"] == null ? null : Ability1Casts.fromJson(json["grenadeCasts"]),
      grenadeCastsPerRound: json["grenadeCastsPerRound"] == null ? null : Ability1Casts.fromJson(json["grenadeCastsPerRound"]),
      grenadeCastsPerMatch: json["grenadeCastsPerMatch"] == null ? null : Ability1Casts.fromJson(json["grenadeCastsPerMatch"]),
      ability1Casts: json["ability1Casts"] == null ? null : Ability1Casts.fromJson(json["ability1Casts"]),
      ability1CastsPerRound: json["ability1CastsPerRound"] == null ? null : Ability1Casts.fromJson(json["ability1CastsPerRound"]),
      ability1CastsPerMatch: json["ability1CastsPerMatch"] == null ? null : Ability1Casts.fromJson(json["ability1CastsPerMatch"]),
      ability2Casts: json["ability2Casts"] == null ? null : Ability1Casts.fromJson(json["ability2Casts"]),
      ability2CastsPerRound: json["ability2CastsPerRound"] == null ? null : Ability1Casts.fromJson(json["ability2CastsPerRound"]),
      ability2CastsPerMatch: json["ability2CastsPerMatch"] == null ? null : Ability1Casts.fromJson(json["ability2CastsPerMatch"]),
      ultimateCasts: json["ultimateCasts"] == null ? null : Ability1Casts.fromJson(json["ultimateCasts"]),
      ultimateCastsPerRound: json["ultimateCastsPerRound"] == null ? null : Ability1Casts.fromJson(json["ultimateCastsPerRound"]),
      ultimateCastsPerMatch: json["ultimateCastsPerMatch"] == null ? null : Ability1Casts.fromJson(json["ultimateCastsPerMatch"]),
      dealtHeadshots: json["dealtHeadshots"] == null ? null : Ability1Casts.fromJson(json["dealtHeadshots"]),
      dealtBodyshots: json["dealtBodyshots"] == null ? null : Ability1Casts.fromJson(json["dealtBodyshots"]),
      dealtLegshots: json["dealtLegshots"] == null ? null : Ability1Casts.fromJson(json["dealtLegshots"]),
      receivedHeadshots: json["receivedHeadshots"] == null ? null : Ability1Casts.fromJson(json["receivedHeadshots"]),
      receivedBodyshots: json["receivedBodyshots"] == null ? null : Ability1Casts.fromJson(json["receivedBodyshots"]),
      receivedLegshots: json["receivedLegshots"] == null ? null : Ability1Casts.fromJson(json["receivedLegshots"]),
      econRating: json["econRating"] == null ? null : Ability1Casts.fromJson(json["econRating"]),
      econRatingPerMatch: json["econRatingPerMatch"] == null ? null : Ability1Casts.fromJson(json["econRatingPerMatch"]),
      econRatingPerRound: json["econRatingPerRound"] == null ? null : Ability1Casts.fromJson(json["econRatingPerRound"]),
      suicides: json["suicides"] == null ? null : Ability1Casts.fromJson(json["suicides"]),
      firstBloods: json["firstBloods"] == null ? null : Ability1Casts.fromJson(json["firstBloods"]),
      firstBloodsPerRound: json["firstBloodsPerRound"] == null ? null : Ability1Casts.fromJson(json["firstBloodsPerRound"]),
      firstBloodsPerMatch: json["firstBloodsPerMatch"] == null ? null : Ability1Casts.fromJson(json["firstBloodsPerMatch"]),
      firstDeaths: json["firstDeaths"] == null ? null : Ability1Casts.fromJson(json["firstDeaths"]),
      firstDeathsPerRound: json["firstDeathsPerRound"] == null ? null : Ability1Casts.fromJson(json["firstDeathsPerRound"]),
      lastDeaths: json["lastDeaths"] == null ? null : Ability1Casts.fromJson(json["lastDeaths"]),
      survived: json["survived"] == null ? null : Ability1Casts.fromJson(json["survived"]),
      traded: json["traded"] == null ? null : Ability1Casts.fromJson(json["traded"]),
      kAst: json["kAST"] == null ? null : Ability1Casts.fromJson(json["kAST"]),
      mostKillsInMatch: json["mostKillsInMatch"] == null ? null : Ability1Casts.fromJson(json["mostKillsInMatch"]),
      flawless: json["flawless"] == null ? null : Ability1Casts.fromJson(json["flawless"]),
      thrifty: json["thrifty"] == null ? null : Ability1Casts.fromJson(json["thrifty"]),
      aces: json["aces"] == null ? null : Ability1Casts.fromJson(json["aces"]),
      teamAces: json["teamAces"] == null ? null : Ability1Casts.fromJson(json["teamAces"]),
      clutches: json["clutches"] == null ? null : Ability1Casts.fromJson(json["clutches"]),
      clutchesPercentage: json["clutchesPercentage"] == null ? null : Ability1Casts.fromJson(json["clutchesPercentage"]),
      clutchesLost: json["clutchesLost"] == null ? null : Ability1Casts.fromJson(json["clutchesLost"]),
      clutches1V1: json["clutches1v1"] == null ? null : Ability1Casts.fromJson(json["clutches1v1"]),
      clutches1V2: json["clutches1v2"] == null ? null : Ability1Casts.fromJson(json["clutches1v2"]),
      clutches1V3: json["clutches1v3"] == null ? null : Ability1Casts.fromJson(json["clutches1v3"]),
      clutches1V4: json["clutches1v4"] == null ? null : Ability1Casts.fromJson(json["clutches1v4"]),
      clutches1V5: json["clutches1v5"] == null ? null : Ability1Casts.fromJson(json["clutches1v5"]),
      clutchesLost1V1: json["clutchesLost1v1"] == null ? null : Ability1Casts.fromJson(json["clutchesLost1v1"]),
      clutchesLost1V2: json["clutchesLost1v2"] == null ? null : Ability1Casts.fromJson(json["clutchesLost1v2"]),
      clutchesLost1V3: json["clutchesLost1v3"] == null ? null : Ability1Casts.fromJson(json["clutchesLost1v3"]),
      clutchesLost1V4: json["clutchesLost1v4"] == null ? null : Ability1Casts.fromJson(json["clutchesLost1v4"]),
      clutchesLost1V5: json["clutchesLost1v5"] == null ? null : Ability1Casts.fromJson(json["clutchesLost1v5"]),
      kills1K: json["kills1K"] == null ? null : Ability1Casts.fromJson(json["kills1K"]),
      kills2K: json["kills2K"] == null ? null : Ability1Casts.fromJson(json["kills2K"]),
      kills3K: json["kills3K"] == null ? null : Ability1Casts.fromJson(json["kills3K"]),
      kills4K: json["kills4K"] == null ? null : Ability1Casts.fromJson(json["kills4K"]),
      kills5K: json["kills5K"] == null ? null : Ability1Casts.fromJson(json["kills5K"]),
      kills6K: json["kills6K"] == null ? null : Ability1Casts.fromJson(json["kills6K"]),
      esr: json["esr"] == null ? null : Ability1Casts.fromJson(json["esr"]),
      plants: json["plants"] == null ? null : Ability1Casts.fromJson(json["plants"]),
      plantsPerMatch: json["plantsPerMatch"] == null ? null : Ability1Casts.fromJson(json["plantsPerMatch"]),
      plantsPerRound: json["plantsPerRound"] == null ? null : Ability1Casts.fromJson(json["plantsPerRound"]),
      attackKills: json["attackKills"] == null ? null : Ability1Casts.fromJson(json["attackKills"]),
      attackKillsPerRound: json["attackKillsPerRound"] == null ? null : Ability1Casts.fromJson(json["attackKillsPerRound"]),
      attackDeaths: json["attackDeaths"] == null ? null : Ability1Casts.fromJson(json["attackDeaths"]),
      attackKdRatio: json["attackKDRatio"] == null ? null : Ability1Casts.fromJson(json["attackKDRatio"]),
      attackAssists: json["attackAssists"] == null ? null : Ability1Casts.fromJson(json["attackAssists"]),
      attackAssistsPerRound: json["attackAssistsPerRound"] == null ? null : Ability1Casts.fromJson(json["attackAssistsPerRound"]),
      attackRoundsWon: json["attackRoundsWon"] == null ? null : Ability1Casts.fromJson(json["attackRoundsWon"]),
      attackRoundsLost: json["attackRoundsLost"] == null ? null : Ability1Casts.fromJson(json["attackRoundsLost"]),
      attackRoundsPlayed: json["attackRoundsPlayed"] == null ? null : Ability1Casts.fromJson(json["attackRoundsPlayed"]),
      attackRoundsWinPct: json["attackRoundsWinPct"] == null ? null : Ability1Casts.fromJson(json["attackRoundsWinPct"]),
      attackScore: json["attackScore"] == null ? null : Ability1Casts.fromJson(json["attackScore"]),
      attackScorePerRound: json["attackScorePerRound"] == null ? null : Ability1Casts.fromJson(json["attackScorePerRound"]),
      attackDamage: json["attackDamage"] == null ? null : Ability1Casts.fromJson(json["attackDamage"]),
      attackDamagePerRound: json["attackDamagePerRound"] == null ? null : Ability1Casts.fromJson(json["attackDamagePerRound"]),
      attackHeadshots: json["attackHeadshots"] == null ? null : Ability1Casts.fromJson(json["attackHeadshots"]),
      attackTraded: json["attackTraded"] == null ? null : Ability1Casts.fromJson(json["attackTraded"]),
      attackSurvived: json["attackSurvived"] == null ? null : Ability1Casts.fromJson(json["attackSurvived"]),
      attackFirstBloods: json["attackFirstBloods"] == null ? null : Ability1Casts.fromJson(json["attackFirstBloods"]),
      attackFirstBloodsPerRound: json["attackFirstBloodsPerRound"] == null ? null : Ability1Casts.fromJson(json["attackFirstBloodsPerRound"]),
      attackFirstDeaths: json["attackFirstDeaths"] == null ? null : Ability1Casts.fromJson(json["attackFirstDeaths"]),
      attackFirstDeathsPerRound: json["attackFirstDeathsPerRound"] == null ? null : Ability1Casts.fromJson(json["attackFirstDeathsPerRound"]),
      attackKast: json["attackKAST"] == null ? null : Ability1Casts.fromJson(json["attackKAST"]),
      defuses: json["defuses"] == null ? null : Ability1Casts.fromJson(json["defuses"]),
      defusesPerMatch: json["defusesPerMatch"] == null ? null : Ability1Casts.fromJson(json["defusesPerMatch"]),
      defusesPerRound: json["defusesPerRound"] == null ? null : Ability1Casts.fromJson(json["defusesPerRound"]),
      defenseKills: json["defenseKills"] == null ? null : Ability1Casts.fromJson(json["defenseKills"]),
      defenseKillsPerRound: json["defenseKillsPerRound"] == null ? null : Ability1Casts.fromJson(json["defenseKillsPerRound"]),
      defenseDeaths: json["defenseDeaths"] == null ? null : Ability1Casts.fromJson(json["defenseDeaths"]),
      defenseKdRatio: json["defenseKDRatio"] == null ? null : Ability1Casts.fromJson(json["defenseKDRatio"]),
      defenseAssists: json["defenseAssists"] == null ? null : Ability1Casts.fromJson(json["defenseAssists"]),
      defenseAssistsPerRound: json["defenseAssistsPerRound"] == null ? null : Ability1Casts.fromJson(json["defenseAssistsPerRound"]),
      defenseRoundsWon: json["defenseRoundsWon"] == null ? null : Ability1Casts.fromJson(json["defenseRoundsWon"]),
      defenseRoundsLost: json["defenseRoundsLost"] == null ? null : Ability1Casts.fromJson(json["defenseRoundsLost"]),
      defenseRoundsPlayed: json["defenseRoundsPlayed"] == null ? null : Ability1Casts.fromJson(json["defenseRoundsPlayed"]),
      defenseRoundsWinPct: json["defenseRoundsWinPct"] == null ? null : Ability1Casts.fromJson(json["defenseRoundsWinPct"]),
      defenseScore: json["defenseScore"] == null ? null : Ability1Casts.fromJson(json["defenseScore"]),
      defenseScorePerRound: json["defenseScorePerRound"] == null ? null : Ability1Casts.fromJson(json["defenseScorePerRound"]),
      defenseDamage: json["defenseDamage"] == null ? null : Ability1Casts.fromJson(json["defenseDamage"]),
      defenseDamagePerRound: json["defenseDamagePerRound"] == null ? null : Ability1Casts.fromJson(json["defenseDamagePerRound"]),
      defenseHeadshots: json["defenseHeadshots"] == null ? null : Ability1Casts.fromJson(json["defenseHeadshots"]),
      defenseTraded: json["defenseTraded"] == null ? null : Ability1Casts.fromJson(json["defenseTraded"]),
      defenseSurvived: json["defenseSurvived"] == null ? null : Ability1Casts.fromJson(json["defenseSurvived"]),
      defenseFirstBloods: json["defenseFirstBloods"] == null ? null : Ability1Casts.fromJson(json["defenseFirstBloods"]),
      defenseFirstBloodsPerRound: json["defenseFirstBloodsPerRound"] == null ? null : Ability1Casts.fromJson(json["defenseFirstBloodsPerRound"]),
      defenseFirstDeaths: json["defenseFirstDeaths"] == null ? null : Ability1Casts.fromJson(json["defenseFirstDeaths"]),
      defenseFirstDeathsPerRound: json["defenseFirstDeathsPerRound"] == null ? null : Ability1Casts.fromJson(json["defenseFirstDeathsPerRound"]),
      defenseKast: json["defenseKAST"] == null ? null : Ability1Casts.fromJson(json["defenseKAST"]),
      rank: json["rank"] == null ? null : Rank.fromJson(json["rank"]),
      trnPerformanceScore: json["trnPerformanceScore"] == null ? null : TrnPerformanceScore.fromJson(json["trnPerformanceScore"]),
      peakRank: json["peakRank"] == null ? null : PeakRa.fromJson(json["peakRank"]),
      peakRating: json["peakRating"] == null ? null : PeakRa.fromJson(json["peakRating"]),
      ability1Kills: json["ability1Kills"] == null ? null : Ability1Casts.fromJson(json["ability1Kills"]),
      ability1KillsPerMatch: json["ability1KillsPerMatch"] == null ? null : Ability1Casts.fromJson(json["ability1KillsPerMatch"]),
      ability2Kills: json["ability2Kills"] == null ? null : Ability1Casts.fromJson(json["ability2Kills"]),
      ability2KillsPerMatch: json["ability2KillsPerMatch"] == null ? null : Ability1Casts.fromJson(json["ability2KillsPerMatch"]),
      grenadeKills: json["grenadeKills"] == null ? null : Ability1Casts.fromJson(json["grenadeKills"]),
      grenadeKillsPerMatch: json["grenadeKillsPerMatch"] == null ? null : Ability1Casts.fromJson(json["grenadeKillsPerMatch"]),
      primaryKills: json["primaryKills"] == null ? null : Ability1Casts.fromJson(json["primaryKills"]),
      primaryKillsPerMatch: json["primaryKillsPerMatch"] == null ? null : Ability1Casts.fromJson(json["primaryKillsPerMatch"]),
      ultimateKills: json["ultimateKills"] == null ? null : Ability1Casts.fromJson(json["ultimateKills"]),
      ultimateKillsPerMatch: json["ultimateKillsPerMatch"] == null ? null : Ability1Casts.fromJson(json["ultimateKillsPerMatch"]),
      pickRate: json["pickRate"] == null ? null : Ability1Casts.fromJson(json["pickRate"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "matchesPlayed": matchesPlayed?.toJson(),
    "matchesWon": matchesWon?.toJson(),
    "matchesLost": matchesLost?.toJson(),
    "matchesTied": matchesTied?.toJson(),
    "matchesWinPct": matchesWinPct?.toJson(),
    "matchesDisconnected": matchesDisconnected?.toJson(),
    "matchesDuration": matchesDuration?.toJson(),
    "timePlayed": timePlayed?.toJson(),
    "mVPs": mVPs?.toJson(),
    "roundsPlayed": roundsPlayed?.toJson(),
    "roundsWon": roundsWon?.toJson(),
    "roundsLost": roundsLost?.toJson(),
    "roundsWinPct": roundsWinPct?.toJson(),
    "roundsDuration": roundsDuration?.toJson(),
    "score": score?.toJson(),
    "scorePerMatch": scorePerMatch?.toJson(),
    "scorePerRound": scorePerRound?.toJson(),
    "kills": kills?.toJson(),
    "killsPerRound": killsPerRound?.toJson(),
    "killsPerMatch": killsPerMatch?.toJson(),
    "deaths": deaths?.toJson(),
    "deathsPerRound": deathsPerRound?.toJson(),
    "deathsPerMatch": deathsPerMatch?.toJson(),
    "assists": assists?.toJson(),
    "assistsPerRound": assistsPerRound?.toJson(),
    "assistsPerMatch": assistsPerMatch?.toJson(),
    "kDRatio": kDRatio?.toJson(),
    "kDARatio": kDaRatio?.toJson(),
    "kADRatio": kAdRatio?.toJson(),
    "damage": damage?.toJson(),
    "damageDelta": damageDelta?.toJson(),
    "damageDeltaPerRound": damageDeltaPerRound?.toJson(),
    "damagePerRound": damagePerRound?.toJson(),
    "damagePerMatch": damagePerMatch?.toJson(),
    "damagePerMinute": damagePerMinute?.toJson(),
    "damageReceived": damageReceived?.toJson(),
    "headshots": headshots?.toJson(),
    "headshotsPerRound": headshotsPerRound?.toJson(),
    "headshotsPercentage": headshotsPercentage?.toJson(),
    "grenadeCasts": grenadeCasts?.toJson(),
    "grenadeCastsPerRound": grenadeCastsPerRound?.toJson(),
    "grenadeCastsPerMatch": grenadeCastsPerMatch?.toJson(),
    "ability1Casts": ability1Casts?.toJson(),
    "ability1CastsPerRound": ability1CastsPerRound?.toJson(),
    "ability1CastsPerMatch": ability1CastsPerMatch?.toJson(),
    "ability2Casts": ability2Casts?.toJson(),
    "ability2CastsPerRound": ability2CastsPerRound?.toJson(),
    "ability2CastsPerMatch": ability2CastsPerMatch?.toJson(),
    "ultimateCasts": ultimateCasts?.toJson(),
    "ultimateCastsPerRound": ultimateCastsPerRound?.toJson(),
    "ultimateCastsPerMatch": ultimateCastsPerMatch?.toJson(),
    "dealtHeadshots": dealtHeadshots?.toJson(),
    "dealtBodyshots": dealtBodyshots?.toJson(),
    "dealtLegshots": dealtLegshots?.toJson(),
    "receivedHeadshots": receivedHeadshots?.toJson(),
    "receivedBodyshots": receivedBodyshots?.toJson(),
    "receivedLegshots": receivedLegshots?.toJson(),
    "econRating": econRating?.toJson(),
    "econRatingPerMatch": econRatingPerMatch?.toJson(),
    "econRatingPerRound": econRatingPerRound?.toJson(),
    "suicides": suicides?.toJson(),
    "firstBloods": firstBloods?.toJson(),
    "firstBloodsPerRound": firstBloodsPerRound?.toJson(),
    "firstBloodsPerMatch": firstBloodsPerMatch?.toJson(),
    "firstDeaths": firstDeaths?.toJson(),
    "firstDeathsPerRound": firstDeathsPerRound?.toJson(),
    "lastDeaths": lastDeaths?.toJson(),
    "survived": survived?.toJson(),
    "traded": traded?.toJson(),
    "kAST": kAst?.toJson(),
    "mostKillsInMatch": mostKillsInMatch?.toJson(),
    "flawless": flawless?.toJson(),
    "thrifty": thrifty?.toJson(),
    "aces": aces?.toJson(),
    "teamAces": teamAces?.toJson(),
    "clutches": clutches?.toJson(),
    "clutchesPercentage": clutchesPercentage?.toJson(),
    "clutchesLost": clutchesLost?.toJson(),
    "clutches1v1": clutches1V1?.toJson(),
    "clutches1v2": clutches1V2?.toJson(),
    "clutches1v3": clutches1V3?.toJson(),
    "clutches1v4": clutches1V4?.toJson(),
    "clutches1v5": clutches1V5?.toJson(),
    "clutchesLost1v1": clutchesLost1V1?.toJson(),
    "clutchesLost1v2": clutchesLost1V2?.toJson(),
    "clutchesLost1v3": clutchesLost1V3?.toJson(),
    "clutchesLost1v4": clutchesLost1V4?.toJson(),
    "clutchesLost1v5": clutchesLost1V5?.toJson(),
    "kills1K": kills1K?.toJson(),
    "kills2K": kills2K?.toJson(),
    "kills3K": kills3K?.toJson(),
    "kills4K": kills4K?.toJson(),
    "kills5K": kills5K?.toJson(),
    "kills6K": kills6K?.toJson(),
    "esr": esr?.toJson(),
    "plants": plants?.toJson(),
    "plantsPerMatch": plantsPerMatch?.toJson(),
    "plantsPerRound": plantsPerRound?.toJson(),
    "attackKills": attackKills?.toJson(),
    "attackKillsPerRound": attackKillsPerRound?.toJson(),
    "attackDeaths": attackDeaths?.toJson(),
    "attackKDRatio": attackKdRatio?.toJson(),
    "attackAssists": attackAssists?.toJson(),
    "attackAssistsPerRound": attackAssistsPerRound?.toJson(),
    "attackRoundsWon": attackRoundsWon?.toJson(),
    "attackRoundsLost": attackRoundsLost?.toJson(),
    "attackRoundsPlayed": attackRoundsPlayed?.toJson(),
    "attackRoundsWinPct": attackRoundsWinPct?.toJson(),
    "attackScore": attackScore?.toJson(),
    "attackScorePerRound": attackScorePerRound?.toJson(),
    "attackDamage": attackDamage?.toJson(),
    "attackDamagePerRound": attackDamagePerRound?.toJson(),
    "attackHeadshots": attackHeadshots?.toJson(),
    "attackTraded": attackTraded?.toJson(),
    "attackSurvived": attackSurvived?.toJson(),
    "attackFirstBloods": attackFirstBloods?.toJson(),
    "attackFirstBloodsPerRound": attackFirstBloodsPerRound?.toJson(),
    "attackFirstDeaths": attackFirstDeaths?.toJson(),
    "attackFirstDeathsPerRound": attackFirstDeathsPerRound?.toJson(),
    "attackKAST": attackKast?.toJson(),
    "defuses": defuses?.toJson(),
    "defusesPerMatch": defusesPerMatch?.toJson(),
    "defusesPerRound": defusesPerRound?.toJson(),
    "defenseKills": defenseKills?.toJson(),
    "defenseKillsPerRound": defenseKillsPerRound?.toJson(),
    "defenseDeaths": defenseDeaths?.toJson(),
    "defenseKDRatio": defenseKdRatio?.toJson(),
    "defenseAssists": defenseAssists?.toJson(),
    "defenseAssistsPerRound": defenseAssistsPerRound?.toJson(),
    "defenseRoundsWon": defenseRoundsWon?.toJson(),
    "defenseRoundsLost": defenseRoundsLost?.toJson(),
    "defenseRoundsPlayed": defenseRoundsPlayed?.toJson(),
    "defenseRoundsWinPct": defenseRoundsWinPct?.toJson(),
    "defenseScore": defenseScore?.toJson(),
    "defenseScorePerRound": defenseScorePerRound?.toJson(),
    "defenseDamage": defenseDamage?.toJson(),
    "defenseDamagePerRound": defenseDamagePerRound?.toJson(),
    "defenseHeadshots": defenseHeadshots?.toJson(),
    "defenseTraded": defenseTraded?.toJson(),
    "defenseSurvived": defenseSurvived?.toJson(),
    "defenseFirstBloods": defenseFirstBloods?.toJson(),
    "defenseFirstBloodsPerRound": defenseFirstBloodsPerRound?.toJson(),
    "defenseFirstDeaths": defenseFirstDeaths?.toJson(),
    "defenseFirstDeathsPerRound": defenseFirstDeathsPerRound?.toJson(),
    "defenseKAST": defenseKast?.toJson(),
    "rank": rank?.toJson(),
    "trnPerformanceScore": trnPerformanceScore?.toJson(),
    "peakRank": peakRank?.toJson(),
    "peakRating": peakRating?.toJson(),
    "ability1Kills": ability1Kills?.toJson(),
    "ability1KillsPerMatch": ability1KillsPerMatch?.toJson(),
    "ability2Kills": ability2Kills?.toJson(),
    "ability2KillsPerMatch": ability2KillsPerMatch?.toJson(),
    "grenadeKills": grenadeKills?.toJson(),
    "grenadeKillsPerMatch": grenadeKillsPerMatch?.toJson(),
    "primaryKills": primaryKills?.toJson(),
    "primaryKillsPerMatch": primaryKillsPerMatch?.toJson(),
    "ultimateKills": ultimateKills?.toJson(),
    "ultimateKillsPerMatch": ultimateKillsPerMatch?.toJson(),
    "pickRate": pickRate?.toJson(),
  };

}

class Ability1Casts {
  Ability1Casts({
    required this.rank,
    required this.percentile,
    required this.displayName,
    required this.displayCategory,
    required this.category,
    required this.description,
    required this.metadata,
    required this.value,
    required this.displayValue,
    required this.displayType,
  });

  final dynamic rank;
  final num? percentile;
  final String? displayName;
  final String? displayCategory;
  final String? category;
  final String? description;
  final Ability1CastsMetadata? metadata;
  final num? value;
  final String? displayValue;
  final String? displayType;

  factory Ability1Casts.fromJson(Map<String, dynamic> json){
    return Ability1Casts(
      rank: json["rank"],
      percentile: json["percentile"],
      displayName: json["displayName"],
      displayCategory: json["displayCategory"],
      category: json["category"],
      description: json["description"],
      metadata: json["metadata"] == null ? null : Ability1CastsMetadata.fromJson(json["metadata"]),
      value: json["value"],
      displayValue: json["displayValue"],
      displayType: json["displayType"],
    );
  }

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "percentile": percentile,
    "displayName": displayName,
    "displayCategory": displayCategory,
    "category": category,
    "description": description,
    "metadata": metadata?.toJson(),
    "value": value,
    "displayValue": displayValue,
    "displayType": displayType,
  };

}

class Ability1CastsMetadata {
  Ability1CastsMetadata({required this.json});
  final Map<String,dynamic> json;

  factory Ability1CastsMetadata.fromJson(Map<String, dynamic> json){
    return Ability1CastsMetadata(
        json: json
    );
  }

  Map<String, dynamic> toJson() => {
  };

}

class MVPs {
  MVPs({
    required this.rank,
    required this.percentile,
    required this.displayName,
    required this.displayCategory,
    required this.category,
    required this.description,
    required this.metadata,
    required this.value,
    required this.displayValue,
    required this.displayType,
  });

  final dynamic rank;
  final dynamic percentile;
  final String? displayName;
  final String? displayCategory;
  final String? category;
  final dynamic description;
  final MVPsMetadata? metadata;
  final num? value;
  final String? displayValue;
  final String? displayType;

  factory MVPs.fromJson(Map<String, dynamic> json){
    return MVPs(
      rank: json["rank"],
      percentile: json["percentile"],
      displayName: json["displayName"],
      displayCategory: json["displayCategory"],
      category: json["category"],
      description: json["description"],
      metadata: json["metadata"] == null ? null : MVPsMetadata.fromJson(json["metadata"]),
      value: json["value"],
      displayValue: json["displayValue"],
      displayType: json["displayType"],
    );
  }

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "percentile": percentile,
    "displayName": displayName,
    "displayCategory": displayCategory,
    "category": category,
    "description": description,
    "metadata": metadata?.toJson(),
    "value": value,
    "displayValue": displayValue,
    "displayType": displayType,
  };

}

class MVPsMetadata {
  MVPsMetadata({
    required this.highlighted,
  });

  final bool? highlighted;

  factory MVPsMetadata.fromJson(Map<String, dynamic> json){
    return MVPsMetadata(
      highlighted: json["highlighted"],
    );
  }

  Map<String, dynamic> toJson() => {
    "highlighted": highlighted,
  };

}

class PeakRa {
  PeakRa({
    required this.rank,
    required this.percentile,
    required this.displayName,
    required this.displayCategory,
    required this.category,
    required this.description,
    required this.metadata,
    required this.value,
    required this.displayValue,
    required this.displayType,
  });

  final dynamic rank;
  final dynamic percentile;
  final String? displayName;
  final dynamic displayCategory;
  final String? category;
  final dynamic description;
  final PeakRankMetadata? metadata;
  final dynamic value;
  final String? displayValue;
  final String? displayType;

  factory PeakRa.fromJson(Map<String, dynamic> json){
    return PeakRa(
      rank: json["rank"],
      percentile: json["percentile"],
      displayName: json["displayName"],
      displayCategory: json["displayCategory"],
      category: json["category"],
      description: json["description"],
      metadata: json["metadata"] == null ? null : PeakRankMetadata.fromJson(json["metadata"]),
      value: json["value"],
      displayValue: json["displayValue"],
      displayType: json["displayType"],
    );
  }

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "percentile": percentile,
    "displayName": displayName,
    "displayCategory": displayCategory,
    "category": category,
    "description": description,
    "metadata": metadata?.toJson(),
    "value": value,
    "displayValue": displayValue,
    "displayType": displayType,
  };

}

class PeakRankMetadata {
  PeakRankMetadata({
    required this.iconUrl,
    required this.tierName,
    required this.actId,
    required this.actName,
  });

  final String? iconUrl;
  final String? tierName;
  final String? actId;
  final String? actName;

  factory PeakRankMetadata.fromJson(Map<String, dynamic> json){
    return PeakRankMetadata(
      iconUrl: json["iconUrl"],
      tierName: json["tierName"],
      actId: json["actId"],
      actName: json["actName"],
    );
  }

  Map<String, dynamic> toJson() => {
    "iconUrl": iconUrl,
    "tierName": tierName,
    "actId": actId,
    "actName": actName,
  };

}

class Rank {
  Rank({
    required this.rank,
    required this.percentile,
    required this.displayName,
    required this.displayCategory,
    required this.category,
    required this.description,
    required this.metadata,
    required this.value,
    required this.displayValue,
    required this.displayType,
  });

  final dynamic rank;
  final dynamic percentile;
  final String? displayName;
  final dynamic displayCategory;
  final String? category;
  final dynamic description;
  final RankMetadata? metadata;
  final dynamic value;
  final String? displayValue;
  final String? displayType;

  factory Rank.fromJson(Map<String, dynamic> json){
    return Rank(
      rank: json["rank"],
      percentile: json["percentile"],
      displayName: json["displayName"],
      displayCategory: json["displayCategory"],
      category: json["category"],
      description: json["description"],
      metadata: json["metadata"] == null ? null : RankMetadata.fromJson(json["metadata"]),
      value: json["value"],
      displayValue: json["displayValue"],
      displayType: json["displayType"],
    );
  }

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "percentile": percentile,
    "displayName": displayName,
    "displayCategory": displayCategory,
    "category": category,
    "description": description,
    "metadata": metadata?.toJson(),
    "value": value,
    "displayValue": displayValue,
    "displayType": displayType,
  };

}

class RankMetadata {
  RankMetadata({
    required this.iconUrl,
    required this.tierName,
  });

  final String? iconUrl;
  final String? tierName;

  factory RankMetadata.fromJson(Map<String, dynamic> json){
    return RankMetadata(
      iconUrl: json["iconUrl"],
      tierName: json["tierName"],
    );
  }

  Map<String, dynamic> toJson() => {
    "iconUrl": iconUrl,
    "tierName": tierName,
  };

}

class TrnPerformanceScore {
  TrnPerformanceScore({
    required this.rank,
    required this.percentile,
    required this.displayName,
    required this.displayCategory,
    required this.category,
    required this.description,
    required this.metadata,
    required this.value,
    required this.displayValue,
    required this.displayType,
  });

  final dynamic rank;
  final dynamic percentile;
  final String? displayName;
  final dynamic displayCategory;
  final dynamic category;
  final dynamic description;
  final TrnPerformanceScoreMetadata? metadata;
  final num? value;
  final String? displayValue;
  final String? displayType;

  factory TrnPerformanceScore.fromJson(Map<String, dynamic> json){
    return TrnPerformanceScore(
      rank: json["rank"],
      percentile: json["percentile"],
      displayName: json["displayName"],
      displayCategory: json["displayCategory"],
      category: json["category"],
      description: json["description"],
      metadata: json["metadata"] == null ? null : TrnPerformanceScoreMetadata.fromJson(json["metadata"]),
      value: json["value"],
      displayValue: json["displayValue"],
      displayType: json["displayType"],
    );
  }

  Map<String, dynamic> toJson() => {
    "rank": rank,
    "percentile": percentile,
    "displayName": displayName,
    "displayCategory": displayCategory,
    "category": category,
    "description": description,
    "metadata": metadata?.toJson(),
    "value": value,
    "displayValue": displayValue,
    "displayType": displayType,
  };

}

class TrnPerformanceScoreMetadata {
  TrnPerformanceScoreMetadata({
    required this.stats,
  });

  final List<String> stats;

  factory TrnPerformanceScoreMetadata.fromJson(Map<String, dynamic> json){
    return TrnPerformanceScoreMetadata(
      stats: json["stats"] == null ? [] : List<String>.from(json["stats"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "stats": stats.map((x) => x).toList(),
  };

}

class UserInfo {
  UserInfo({
    required this.userId,
    required this.isPremium,
    required this.isVerified,
    required this.isInfluencer,
    required this.isPartner,
    required this.countryCode,
    required this.customAvatarUrl,
    required this.customHeroUrl,
    required this.customAvatarFrame,
    required this.customAvatarFrameInfo,
    required this.premiumDuration,
    required this.socialAccounts,
    required this.pageviews,
    required this.xpTier,
    required this.isSuspicious,
  });

  final dynamic userId;
  final bool? isPremium;
  final bool? isVerified;
  final bool? isInfluencer;
  final bool? isPartner;
  final dynamic countryCode;
  final dynamic customAvatarUrl;
  final dynamic customHeroUrl;
  final dynamic customAvatarFrame;
  final dynamic customAvatarFrameInfo;
  final dynamic premiumDuration;
  final List<dynamic> socialAccounts;
  final num? pageviews;
  final dynamic xpTier;
  final dynamic isSuspicious;

  factory UserInfo.fromJson(Map<String, dynamic> json){
    return UserInfo(
      userId: json["userId"],
      isPremium: json["isPremium"],
      isVerified: json["isVerified"],
      isInfluencer: json["isInfluencer"],
      isPartner: json["isPartner"],
      countryCode: json["countryCode"],
      customAvatarUrl: json["customAvatarUrl"],
      customHeroUrl: json["customHeroUrl"],
      customAvatarFrame: json["customAvatarFrame"],
      customAvatarFrameInfo: json["customAvatarFrameInfo"],
      premiumDuration: json["premiumDuration"],
      socialAccounts: json["socialAccounts"] == null ? [] : List<dynamic>.from(json["socialAccounts"]!.map((x) => x)),
      pageviews: json["pageviews"],
      xpTier: json["xpTier"],
      isSuspicious: json["isSuspicious"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "isPremium": isPremium,
    "isVerified": isVerified,
    "isInfluencer": isInfluencer,
    "isPartner": isPartner,
    "countryCode": countryCode,
    "customAvatarUrl": customAvatarUrl,
    "customHeroUrl": customHeroUrl,
    "customAvatarFrame": customAvatarFrame,
    "customAvatarFrameInfo": customAvatarFrameInfo,
    "premiumDuration": premiumDuration,
    "socialAccounts": socialAccounts.map((x) => x).toList(),
    "pageviews": pageviews,
    "xpTier": xpTier,
    "isSuspicious": isSuspicious,
  };

}
