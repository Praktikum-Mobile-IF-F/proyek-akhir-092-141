class ValorantTrackerModel {
  TrackerData data;

  ValorantTrackerModel({
    required this.data,
  });

}

class TrackerData {
  PlatformInfo platformInfo;
  UserInfo userInfo;
  DataMetadata metadata;
  List<Segment> segments;
  List<dynamic> availableSegments;
  DateTime expiryDate;

  TrackerData({
    required this.platformInfo,
    required this.userInfo,
    required this.metadata,
    required this.segments,
    required this.availableSegments,
    required this.expiryDate,
  });

}

class DataMetadata {
  String activeShard;
  Schema schema;
  String privacy;
  Playlist defaultPlaylist;
  String defaultSeason;
  dynamic premierRosterId;
  dynamic premierCrests;
  int accountLevel;

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

}

enum Playlist {
  COMPETITIVE
}

enum Schema {
  STATSV2
}

class PlatformInfo {
  String platformSlug;
  String platformUserId;
  String platformUserHandle;
  String platformUserIdentifier;
  String avatarUrl;
  dynamic additionalParameters;

  PlatformInfo({
    required this.platformSlug,
    required this.platformUserId,
    required this.platformUserHandle,
    required this.platformUserIdentifier,
    required this.avatarUrl,
    required this.additionalParameters,
  });

}

class Segment {
  Type type;
  Attributes attributes;
  SegmentMetadata metadata;
  DateTime expiryDate;
  Stats stats;

  Segment({
    required this.type,
    required this.attributes,
    required this.metadata,
    required this.expiryDate,
    required this.stats,
  });

}

class Attributes {
  String? seasonId;
  Playlist? playlist;
  String? key;
  String? mapKey;

  Attributes({
    this.seasonId,
    this.playlist,
    this.key,
    this.mapKey,
  });

}

class SegmentMetadata {
  String? name;
  String? shortName;
  String? playlistName;
  DateTime? startTime;
  DateTime? endTime;
  Schema? schema;
  String? imageUrl;
  String? role;
  String? color;
  Abilities? abilities;

  SegmentMetadata({
    this.name,
    this.shortName,
    this.playlistName,
    this.startTime,
    this.endTime,
    this.schema,
    this.imageUrl,
    this.role,
    this.color,
    this.abilities,
  });

}

class Abilities {
  Ability1 ability1;
  Ability1 ability2;
  Ability1 grenade;
  Ability1 ultimate;
  Ability1? passive;

  Abilities({
    required this.ability1,
    required this.ability2,
    required this.grenade,
    required this.ultimate,
    this.passive,
  });

}

class Ability1 {
  String name;
  String? imageUrl;

  Ability1({
    required this.name,
    required this.imageUrl,
  });

}

class Stats {
  Ability1Casts? matchesPlayed;
  Ability1Casts? matchesWon;
  Ability1Casts? matchesLost;
  Ability1Casts? matchesTied;
  Ability1Casts? matchesWinPct;
  Ability1Casts? matchesDisconnected;
  Ability1Casts? matchesDuration;
  Ability1Casts? timePlayed;
  MVPs? mVPs;
  Ability1Casts? roundsPlayed;
  Ability1Casts? roundsWon;
  Ability1Casts? roundsLost;
  Ability1Casts? roundsWinPct;
  Ability1Casts? roundsDuration;
  Ability1Casts? score;
  Ability1Casts? scorePerMatch;
  Ability1Casts? scorePerRound;
  Ability1Casts? kills;
  Ability1Casts? killsPerRound;
  Ability1Casts? killsPerMatch;
  Ability1Casts? deaths;
  Ability1Casts? deathsPerRound;
  Ability1Casts? deathsPerMatch;
  Ability1Casts? assists;
  Ability1Casts? assistsPerRound;
  Ability1Casts? assistsPerMatch;
  Ability1Casts? kDRatio;
  Ability1Casts? kDaRatio;
  Ability1Casts? kAdRatio;
  Ability1Casts? damage;
  Ability1Casts? damageDelta;
  Ability1Casts? damageDeltaPerRound;
  Ability1Casts? damagePerRound;
  Ability1Casts? damagePerMatch;
  Ability1Casts? damagePerMinute;
  Ability1Casts? damageReceived;
  Ability1Casts? headshots;
  Ability1Casts? headshotsPerRound;
  Ability1Casts? headshotsPercentage;
  Ability1Casts? grenadeCasts;
  Ability1Casts? grenadeCastsPerRound;
  Ability1Casts? grenadeCastsPerMatch;
  Ability1Casts? ability1Casts;
  Ability1Casts? ability1CastsPerRound;
  Ability1Casts? ability1CastsPerMatch;
  Ability1Casts? ability2Casts;
  Ability1Casts? ability2CastsPerRound;
  Ability1Casts? ability2CastsPerMatch;
  Ability1Casts? ultimateCasts;
  Ability1Casts? ultimateCastsPerRound;
  Ability1Casts? ultimateCastsPerMatch;
  Ability1Casts? dealtHeadshots;
  Ability1Casts? dealtBodyshots;
  Ability1Casts? dealtLegshots;
  Ability1Casts? receivedHeadshots;
  Ability1Casts? receivedBodyshots;
  Ability1Casts? receivedLegshots;
  Ability1Casts? econRating;
  Ability1Casts? econRatingPerMatch;
  Ability1Casts? econRatingPerRound;
  Ability1Casts? suicides;
  Ability1Casts? firstBloods;
  Ability1Casts? firstBloodsPerRound;
  Ability1Casts? firstBloodsPerMatch;
  Ability1Casts? firstDeaths;
  Ability1Casts? firstDeathsPerRound;
  Ability1Casts? lastDeaths;
  Ability1Casts? survived;
  Ability1Casts? traded;
  Ability1Casts? kAst;
  Ability1Casts? mostKillsInMatch;
  Ability1Casts? flawless;
  Ability1Casts? thrifty;
  Ability1Casts? aces;
  Ability1Casts? teamAces;
  Ability1Casts? clutches;
  Ability1Casts? clutchesPercentage;
  Ability1Casts? clutchesLost;
  Ability1Casts? clutches1V1;
  Ability1Casts? clutches1V2;
  Ability1Casts? clutches1V3;
  Ability1Casts? clutches1V4;
  Ability1Casts? clutches1V5;
  Ability1Casts? clutchesLost1V1;
  Ability1Casts? clutchesLost1V2;
  Ability1Casts? clutchesLost1V3;
  Ability1Casts? clutchesLost1V4;
  Ability1Casts? clutchesLost1V5;
  Ability1Casts? kills1K;
  Ability1Casts? kills2K;
  Ability1Casts? kills3K;
  Ability1Casts? kills4K;
  Ability1Casts? kills5K;
  Ability1Casts? kills6K;
  Ability1Casts? esr;
  Ability1Casts? plants;
  Ability1Casts? plantsPerMatch;
  Ability1Casts? plantsPerRound;
  Ability1Casts? attackKills;
  Ability1Casts? attackKillsPerRound;
  Ability1Casts? attackDeaths;
  Ability1Casts? attackKdRatio;
  Ability1Casts? attackAssists;
  Ability1Casts? attackAssistsPerRound;
  Ability1Casts? attackRoundsWon;
  Ability1Casts? attackRoundsLost;
  Ability1Casts? attackRoundsPlayed;
  Ability1Casts? attackRoundsWinPct;
  Ability1Casts? attackScore;
  Ability1Casts? attackScorePerRound;
  Ability1Casts? attackDamage;
  Ability1Casts? attackDamagePerRound;
  Ability1Casts? attackHeadshots;
  Ability1Casts? attackTraded;
  Ability1Casts? attackSurvived;
  Ability1Casts? attackFirstBloods;
  Ability1Casts? attackFirstBloodsPerRound;
  Ability1Casts? attackFirstDeaths;
  Ability1Casts? attackFirstDeathsPerRound;
  Ability1Casts? attackKast;
  Ability1Casts? defuses;
  Ability1Casts? defusesPerMatch;
  Ability1Casts? defusesPerRound;
  Ability1Casts? defenseKills;
  Ability1Casts? defenseKillsPerRound;
  Ability1Casts? defenseDeaths;
  Ability1Casts? defenseKdRatio;
  Ability1Casts? defenseAssists;
  Ability1Casts? defenseAssistsPerRound;
  Ability1Casts? defenseRoundsWon;
  Ability1Casts? defenseRoundsLost;
  Ability1Casts? defenseRoundsPlayed;
  Ability1Casts? defenseRoundsWinPct;
  Ability1Casts? defenseScore;
  Ability1Casts? defenseScorePerRound;
  Ability1Casts? defenseDamage;
  Ability1Casts? defenseDamagePerRound;
  Ability1Casts? defenseHeadshots;
  Ability1Casts? defenseTraded;
  Ability1Casts? defenseSurvived;
  Ability1Casts? defenseFirstBloods;
  Ability1Casts? defenseFirstBloodsPerRound;
  Ability1Casts? defenseFirstDeaths;
  Ability1Casts? defenseFirstDeathsPerRound;
  Ability1Casts? defenseKast;
  Rank? rank;
  TrnPerformanceScore? trnPerformanceScore;
  PeakRa? peakRank;
  PeakRa? peakRating;
  Ability1Casts? ability1Kills;
  Ability1Casts? ability1KillsPerMatch;
  Ability1Casts? ability2Kills;
  Ability1Casts? ability2KillsPerMatch;
  Ability1Casts? grenadeKills;
  Ability1Casts? grenadeKillsPerMatch;
  Ability1Casts? primaryKills;
  Ability1Casts? primaryKillsPerMatch;
  Ability1Casts? ultimateKills;
  Ability1Casts? ultimateKillsPerMatch;
  Ability1Casts? pickRate;

  Stats({
    this.matchesPlayed,
    this.matchesWon,
    this.matchesLost,
    this.matchesTied,
    this.matchesWinPct,
    this.matchesDisconnected,
    this.matchesDuration,
    this.timePlayed,
    this.mVPs,
    this.roundsPlayed,
    this.roundsWon,
    this.roundsLost,
    this.roundsWinPct,
    this.roundsDuration,
    this.score,
    this.scorePerMatch,
    this.scorePerRound,
    this.kills,
    this.killsPerRound,
    this.killsPerMatch,
    this.deaths,
    this.deathsPerRound,
    this.deathsPerMatch,
    this.assists,
    this.assistsPerRound,
    this.assistsPerMatch,
    this.kDRatio,
    this.kDaRatio,
    this.kAdRatio,
    this.damage,
    this.damageDelta,
    this.damageDeltaPerRound,
    this.damagePerRound,
    this.damagePerMatch,
    this.damagePerMinute,
    this.damageReceived,
    this.headshots,
    this.headshotsPerRound,
    this.headshotsPercentage,
    this.grenadeCasts,
    this.grenadeCastsPerRound,
    this.grenadeCastsPerMatch,
    this.ability1Casts,
    this.ability1CastsPerRound,
    this.ability1CastsPerMatch,
    this.ability2Casts,
    this.ability2CastsPerRound,
    this.ability2CastsPerMatch,
    this.ultimateCasts,
    this.ultimateCastsPerRound,
    this.ultimateCastsPerMatch,
    this.dealtHeadshots,
    this.dealtBodyshots,
    this.dealtLegshots,
    this.receivedHeadshots,
    this.receivedBodyshots,
    this.receivedLegshots,
    this.econRating,
    this.econRatingPerMatch,
    this.econRatingPerRound,
    this.suicides,
    this.firstBloods,
    this.firstBloodsPerRound,
    this.firstBloodsPerMatch,
    this.firstDeaths,
    this.firstDeathsPerRound,
    this.lastDeaths,
    this.survived,
    this.traded,
    this.kAst,
    this.mostKillsInMatch,
    this.flawless,
    this.thrifty,
    this.aces,
    this.teamAces,
    this.clutches,
    this.clutchesPercentage,
    this.clutchesLost,
    this.clutches1V1,
    this.clutches1V2,
    this.clutches1V3,
    this.clutches1V4,
    this.clutches1V5,
    this.clutchesLost1V1,
    this.clutchesLost1V2,
    this.clutchesLost1V3,
    this.clutchesLost1V4,
    this.clutchesLost1V5,
    this.kills1K,
    this.kills2K,
    this.kills3K,
    this.kills4K,
    this.kills5K,
    this.kills6K,
    this.esr,
    this.plants,
    this.plantsPerMatch,
    this.plantsPerRound,
    this.attackKills,
    this.attackKillsPerRound,
    this.attackDeaths,
    this.attackKdRatio,
    this.attackAssists,
    this.attackAssistsPerRound,
    this.attackRoundsWon,
    this.attackRoundsLost,
    this.attackRoundsPlayed,
    this.attackRoundsWinPct,
    this.attackScore,
    this.attackScorePerRound,
    this.attackDamage,
    this.attackDamagePerRound,
    this.attackHeadshots,
    this.attackTraded,
    this.attackSurvived,
    this.attackFirstBloods,
    this.attackFirstBloodsPerRound,
    this.attackFirstDeaths,
    this.attackFirstDeathsPerRound,
    this.attackKast,
    this.defuses,
    this.defusesPerMatch,
    this.defusesPerRound,
    this.defenseKills,
    this.defenseKillsPerRound,
    this.defenseDeaths,
    this.defenseKdRatio,
    this.defenseAssists,
    this.defenseAssistsPerRound,
    this.defenseRoundsWon,
    this.defenseRoundsLost,
    this.defenseRoundsPlayed,
    this.defenseRoundsWinPct,
    this.defenseScore,
    this.defenseScorePerRound,
    this.defenseDamage,
    this.defenseDamagePerRound,
    this.defenseHeadshots,
    this.defenseTraded,
    this.defenseSurvived,
    this.defenseFirstBloods,
    this.defenseFirstBloodsPerRound,
    this.defenseFirstDeaths,
    this.defenseFirstDeathsPerRound,
    this.defenseKast,
    this.rank,
    this.trnPerformanceScore,
    this.peakRank,
    this.peakRating,
    this.ability1Kills,
    this.ability1KillsPerMatch,
    this.ability2Kills,
    this.ability2KillsPerMatch,
    this.grenadeKills,
    this.grenadeKillsPerMatch,
    this.primaryKills,
    this.primaryKillsPerMatch,
    this.ultimateKills,
    this.ultimateKillsPerMatch,
    this.pickRate,
  });

}

class Ability1Casts {
  dynamic rank;
  int? percentile;
  String displayName;
  DisplayCategory? displayCategory;
  Category? category;
  String? description;
  Ability1CastsMetadata metadata;
  double value;
  String displayValue;
  DisplayType displayType;

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

}

enum Category {
  ATTACK,
  COMBAT,
  DEFENSE,
  GAME
}

enum DisplayCategory {
  ATTACK,
  COMBAT,
  DEFENSE,
  GAME
}

enum DisplayType {
  NUMBER,
  NUMBER_PERCENTAGE,
  NUMBER_PRECISION1,
  NUMBER_PRECISION2,
  TIME_SECONDS
}

class Ability1CastsMetadata {
  Ability1CastsMetadata();
}

class MVPs {
  dynamic rank;
  dynamic percentile;
  DisplayName displayName;
  DisplayCategory displayCategory;
  Category category;
  dynamic description;
  MVPsMetadata metadata;
  int value;
  String displayValue;
  DisplayType displayType;

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

}

enum DisplayName {
  MV_PS
}

class MVPsMetadata {
  bool? highlighted;

  MVPsMetadata({
    this.highlighted,
  });

}

class PeakRa {
  dynamic rank;
  dynamic percentile;
  String displayName;
  dynamic displayCategory;
  String category;
  dynamic description;
  PeakRankMetadata metadata;
  dynamic value;
  String displayValue;
  String displayType;

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

}

class PeakRankMetadata {
  String iconUrl;
  String tierName;
  String actId;
  String actName;

  PeakRankMetadata({
    required this.iconUrl,
    required this.tierName,
    required this.actId,
    required this.actName,
  });

}

class Rank {
  dynamic rank;
  dynamic percentile;
  String displayName;
  dynamic displayCategory;
  String category;
  dynamic description;
  RankMetadata metadata;
  dynamic value;
  String displayValue;
  String displayType;

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

}

class RankMetadata {
  String iconUrl;
  String tierName;

  RankMetadata({
    required this.iconUrl,
    required this.tierName,
  });

}

class TrnPerformanceScore {
  dynamic rank;
  dynamic percentile;
  String displayName;
  dynamic displayCategory;
  dynamic category;
  dynamic description;
  TrnPerformanceScoreMetadata metadata;
  int value;
  String displayValue;
  DisplayType displayType;

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

}

class TrnPerformanceScoreMetadata {
  List<String> stats;

  TrnPerformanceScoreMetadata({
    required this.stats,
  });

}

enum Type {
  AGENT,
  AGENT_ROLE,
  AGENT_TOP_MAP,
  PEAK_RATING,
  SEASON
}

class UserInfo {
  dynamic userId;
  bool isPremium;
  bool isVerified;
  bool isInfluencer;
  bool isPartner;
  dynamic countryCode;
  dynamic customAvatarUrl;
  dynamic customHeroUrl;
  dynamic customAvatarFrame;
  dynamic customAvatarFrameInfo;
  dynamic premiumDuration;
  List<dynamic> socialAccounts;
  int pageviews;
  dynamic xpTier;
  dynamic isSuspicious;

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

}
