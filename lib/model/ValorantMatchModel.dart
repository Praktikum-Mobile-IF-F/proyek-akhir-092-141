class ValorantMatchModel {
  ValorantMatchModel({
    required this.data,
  });

  final MatchData? data;

  factory ValorantMatchModel.fromJson(Map<String, dynamic> json){
    return ValorantMatchModel(
      data: json["data"] == null ? null : MatchData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };

}

class MatchData {
  MatchData({
    required this.matches,
    required this.metadata,
    required this.paginationType,
    required this.requestingPlayerAttributes,
    required this.expiryDate,
  });

  final List<Match> matches;
  final DataMetadata? metadata;
  final String? paginationType;
  final RequestingPlayerAttributesClass? requestingPlayerAttributes;
  final DateTime? expiryDate;

  factory MatchData.fromJson(Map<String, dynamic> json){
    return MatchData(
      matches: json["matches"] == null ? [] : List<Match>.from(json["matches"]!.map((x) => Match.fromJson(x))),
      metadata: json["metadata"] == null ? null : DataMetadata.fromJson(json["metadata"]),
      paginationType: json["paginationType"],
      requestingPlayerAttributes: json["requestingPlayerAttributes"] == null ? null : RequestingPlayerAttributesClass.fromJson(json["requestingPlayerAttributes"]),
      expiryDate: DateTime.tryParse(json["expiryDate"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "matches": matches.map((x) => x.toJson()).toList(),
    "metadata": metadata?.toJson(),
    "paginationType": paginationType,
    "requestingPlayerAttributes": requestingPlayerAttributes?.toJson(),
    "expiryDate": expiryDate?.toIso8601String(),
  };

}

class Match {
  Match({
    required this.attributes,
    required this.metadata,
    required this.segments,
    required this.streams,
    required this.expiryDate,
  });

  final MatchAttributes? attributes;
  final MatchMetadata? metadata;
  final List<Segment> segments;
  final dynamic streams;
  final DateTime? expiryDate;

  factory Match.fromJson(Map<String, dynamic> json){
    return Match(
      attributes: json["attributes"] == null ? null : MatchAttributes.fromJson(json["attributes"]),
      metadata: json["metadata"] == null ? null : MatchMetadata.fromJson(json["metadata"]),
      segments: json["segments"] == null ? [] : List<Segment>.from(json["segments"]!.map((x) => Segment.fromJson(x))),
      streams: json["streams"],
      expiryDate: DateTime.tryParse(json["expiryDate"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "attributes": attributes?.toJson(),
    "metadata": metadata?.toJson(),
    "segments": segments.map((x) => x.toJson()).toList(),
    "streams": streams,
    "expiryDate": expiryDate?.toIso8601String(),
  };

}

class MatchAttributes {
  MatchAttributes({
    required this.id,
    required this.mapId,
    required this.modeId,
    required this.seasonId,
  });

  final String? id;
  final String? mapId;
  final String? modeId;
  final String? seasonId;

  factory MatchAttributes.fromJson(Map<String, dynamic> json){
    return MatchAttributes(
      id: json["id"],
      mapId: json["mapId"],
      modeId: json["modeId"],
      seasonId: json["seasonId"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "mapId": mapId,
    "modeId": modeId,
    "seasonId": seasonId,
  };

}

class MatchMetadata {
  MatchMetadata({
    required this.modeKey,
    required this.modeName,
    required this.modeImageUrl,
    required this.modeMaxRounds,
    required this.isAvailable,
    required this.timestamp,
    required this.result,
    required this.map,
    required this.mapName,
    required this.mapImageUrl,
    required this.seasonName,
  });

  final String? modeKey;
  final String? modeName;
  final String? modeImageUrl;
  final num? modeMaxRounds;
  final bool? isAvailable;
  final DateTime? timestamp;
  final String? result;
  final String? map;
  final String? mapName;
  final String? mapImageUrl;
  final String? seasonName;

  factory MatchMetadata.fromJson(Map<String, dynamic> json){
    return MatchMetadata(
      modeKey: json["modeKey"],
      modeName: json["modeName"],
      modeImageUrl: json["modeImageUrl"],
      modeMaxRounds: json["modeMaxRounds"],
      isAvailable: json["isAvailable"],
      timestamp: DateTime.tryParse(json["timestamp"] ?? ""),
      result: json["result"],
      map: json["map"],
      mapName: json["mapName"],
      mapImageUrl: json["mapImageUrl"],
      seasonName: json["seasonName"],
    );
  }

  Map<String, dynamic> toJson() => {
    "modeKey": modeKey,
    "modeName": modeName,
    "modeImageUrl": modeImageUrl,
    "modeMaxRounds": modeMaxRounds,
    "isAvailable": isAvailable,
    "timestamp": timestamp?.toIso8601String(),
    "result": result,
    "map": map,
    "mapName": mapName,
    "mapImageUrl": mapImageUrl,
    "seasonName": seasonName,
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
  final RequestingPlayerAttributesClass? attributes;
  final SegmentMetadata? metadata;
  final DateTime? expiryDate;
  final Stats? stats;

  factory Segment.fromJson(Map<String, dynamic> json){
    return Segment(
      type: json["type"],
      attributes: json["attributes"] == null ? null : RequestingPlayerAttributesClass.fromJson(json["attributes"]),
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

class RequestingPlayerAttributesClass {
  RequestingPlayerAttributesClass({
    required this.platformSlug,
    required this.platformUserIdentifier,
  });

  final String? platformSlug;
  final String? platformUserIdentifier;

  factory RequestingPlayerAttributesClass.fromJson(Map<String, dynamic> json){
    return RequestingPlayerAttributesClass(
      platformSlug: json["platformSlug"],
      platformUserIdentifier: json["platformUserIdentifier"],
    );
  }

  Map<String, dynamic> toJson() => {
    "platformSlug": platformSlug,
    "platformUserIdentifier": platformUserIdentifier,
  };

}

class SegmentMetadata {
  SegmentMetadata({
    required this.platformUserHandle,
    required this.hasWon,
    required this.result,
    required this.agent,
    required this.agentName,
    required this.agentColor,
    required this.agentImageUrl,
  });

  final String? platformUserHandle;
  final bool? hasWon;
  final String? result;
  final String? agent;
  final String? agentName;
  final String? agentColor;
  final String? agentImageUrl;

  factory SegmentMetadata.fromJson(Map<String, dynamic> json){
    return SegmentMetadata(
      platformUserHandle: json["platformUserHandle"],
      hasWon: json["hasWon"],
      result: json["result"],
      agent: json["agent"],
      agentName: json["agentName"],
      agentColor: json["agentColor"],
      agentImageUrl: json["agentImageUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
    "platformUserHandle": platformUserHandle,
    "hasWon": hasWon,
    "result": result,
    "agent": agent,
    "agentName": agentName,
    "agentColor": agentColor,
    "agentImageUrl": agentImageUrl,
  };

}

class Stats {
  Stats({
    required this.playtime,
    required this.roundsPlayed,
    required this.roundsWon,
    required this.roundsLost,
    required this.roundsDisconnected,
    required this.placement,
    required this.score,
    required this.kills,
    required this.deaths,
    required this.assists,
    required this.damage,
    required this.damageReceived,
    required this.headshots,
    required this.grenadeCasts,
    required this.ability1Casts,
    required this.ability2Casts,
    required this.ultimateCasts,
    required this.dealtHeadshots,
    required this.dealtBodyshots,
    required this.dealtLegshots,
    required this.econRating,
    required this.suicides,
    required this.revived,
    required this.firstBloods,
    required this.firstDeaths,
    required this.lastDeaths,
    required this.survived,
    required this.traded,
    required this.kasted,
    required this.kAst,
    required this.flawless,
    required this.thrifty,
    required this.aces,
    required this.teamAces,
    required this.clutches,
    required this.clutchesLost,
    required this.plants,
    required this.defuses,
    required this.kdRatio,
    required this.scorePerRound,
    required this.damagePerRound,
    required this.headshotsPercentage,
    required this.damageDelta,
    required this.damageDeltaPerRound,
    required this.rank,
    required this.trnPerformanceScore,
  });

  final Ability1Casts? playtime;
  final Ability1Casts? roundsPlayed;
  final Ability1Casts? roundsWon;
  final Ability1Casts? roundsLost;
  final Ability1Casts? roundsDisconnected;
  final Ability1Casts? placement;
  final Ability1Casts? score;
  final Ability1Casts? kills;
  final Ability1Casts? deaths;
  final Ability1Casts? assists;
  final Ability1Casts? damage;
  final Ability1Casts? damageReceived;
  final Ability1Casts? headshots;
  final Ability1Casts? grenadeCasts;
  final Ability1Casts? ability1Casts;
  final Ability1Casts? ability2Casts;
  final Ability1Casts? ultimateCasts;
  final Ability1Casts? dealtHeadshots;
  final Ability1Casts? dealtBodyshots;
  final Ability1Casts? dealtLegshots;
  final Ability1Casts? econRating;
  final Ability1Casts? suicides;
  final Ability1Casts? revived;
  final Ability1Casts? firstBloods;
  final Ability1Casts? firstDeaths;
  final Ability1Casts? lastDeaths;
  final Ability1Casts? survived;
  final Ability1Casts? traded;
  final Ability1Casts? kasted;
  final Ability1Casts? kAst;
  final Ability1Casts? flawless;
  final Ability1Casts? thrifty;
  final Ability1Casts? aces;
  final Ability1Casts? teamAces;
  final Ability1Casts? clutches;
  final Ability1Casts? clutchesLost;
  final Ability1Casts? plants;
  final Ability1Casts? defuses;
  final Ability1Casts? kdRatio;
  final Ability1Casts? scorePerRound;
  final Ability1Casts? damagePerRound;
  final Ability1Casts? headshotsPercentage;
  final Ability1Casts? damageDelta;
  final Ability1Casts? damageDeltaPerRound;
  final Rank? rank;
  final TrnPerformanceScore? trnPerformanceScore;

  factory Stats.fromJson(Map<String, dynamic> json){
    return Stats(
      playtime: json["playtime"] == null ? null : Ability1Casts.fromJson(json["playtime"]),
      roundsPlayed: json["roundsPlayed"] == null ? null : Ability1Casts.fromJson(json["roundsPlayed"]),
      roundsWon: json["roundsWon"] == null ? null : Ability1Casts.fromJson(json["roundsWon"]),
      roundsLost: json["roundsLost"] == null ? null : Ability1Casts.fromJson(json["roundsLost"]),
      roundsDisconnected: json["roundsDisconnected"] == null ? null : Ability1Casts.fromJson(json["roundsDisconnected"]),
      placement: json["placement"] == null ? null : Ability1Casts.fromJson(json["placement"]),
      score: json["score"] == null ? null : Ability1Casts.fromJson(json["score"]),
      kills: json["kills"] == null ? null : Ability1Casts.fromJson(json["kills"]),
      deaths: json["deaths"] == null ? null : Ability1Casts.fromJson(json["deaths"]),
      assists: json["assists"] == null ? null : Ability1Casts.fromJson(json["assists"]),
      damage: json["damage"] == null ? null : Ability1Casts.fromJson(json["damage"]),
      damageReceived: json["damageReceived"] == null ? null : Ability1Casts.fromJson(json["damageReceived"]),
      headshots: json["headshots"] == null ? null : Ability1Casts.fromJson(json["headshots"]),
      grenadeCasts: json["grenadeCasts"] == null ? null : Ability1Casts.fromJson(json["grenadeCasts"]),
      ability1Casts: json["ability1Casts"] == null ? null : Ability1Casts.fromJson(json["ability1Casts"]),
      ability2Casts: json["ability2Casts"] == null ? null : Ability1Casts.fromJson(json["ability2Casts"]),
      ultimateCasts: json["ultimateCasts"] == null ? null : Ability1Casts.fromJson(json["ultimateCasts"]),
      dealtHeadshots: json["dealtHeadshots"] == null ? null : Ability1Casts.fromJson(json["dealtHeadshots"]),
      dealtBodyshots: json["dealtBodyshots"] == null ? null : Ability1Casts.fromJson(json["dealtBodyshots"]),
      dealtLegshots: json["dealtLegshots"] == null ? null : Ability1Casts.fromJson(json["dealtLegshots"]),
      econRating: json["econRating"] == null ? null : Ability1Casts.fromJson(json["econRating"]),
      suicides: json["suicides"] == null ? null : Ability1Casts.fromJson(json["suicides"]),
      revived: json["revived"] == null ? null : Ability1Casts.fromJson(json["revived"]),
      firstBloods: json["firstBloods"] == null ? null : Ability1Casts.fromJson(json["firstBloods"]),
      firstDeaths: json["firstDeaths"] == null ? null : Ability1Casts.fromJson(json["firstDeaths"]),
      lastDeaths: json["lastDeaths"] == null ? null : Ability1Casts.fromJson(json["lastDeaths"]),
      survived: json["survived"] == null ? null : Ability1Casts.fromJson(json["survived"]),
      traded: json["traded"] == null ? null : Ability1Casts.fromJson(json["traded"]),
      kasted: json["kasted"] == null ? null : Ability1Casts.fromJson(json["kasted"]),
      kAst: json["kAST"] == null ? null : Ability1Casts.fromJson(json["kAST"]),
      flawless: json["flawless"] == null ? null : Ability1Casts.fromJson(json["flawless"]),
      thrifty: json["thrifty"] == null ? null : Ability1Casts.fromJson(json["thrifty"]),
      aces: json["aces"] == null ? null : Ability1Casts.fromJson(json["aces"]),
      teamAces: json["teamAces"] == null ? null : Ability1Casts.fromJson(json["teamAces"]),
      clutches: json["clutches"] == null ? null : Ability1Casts.fromJson(json["clutches"]),
      clutchesLost: json["clutchesLost"] == null ? null : Ability1Casts.fromJson(json["clutchesLost"]),
      plants: json["plants"] == null ? null : Ability1Casts.fromJson(json["plants"]),
      defuses: json["defuses"] == null ? null : Ability1Casts.fromJson(json["defuses"]),
      kdRatio: json["kdRatio"] == null ? null : Ability1Casts.fromJson(json["kdRatio"]),
      scorePerRound: json["scorePerRound"] == null ? null : Ability1Casts.fromJson(json["scorePerRound"]),
      damagePerRound: json["damagePerRound"] == null ? null : Ability1Casts.fromJson(json["damagePerRound"]),
      headshotsPercentage: json["headshotsPercentage"] == null ? null : Ability1Casts.fromJson(json["headshotsPercentage"]),
      damageDelta: json["damageDelta"] == null ? null : Ability1Casts.fromJson(json["damageDelta"]),
      damageDeltaPerRound: json["damageDeltaPerRound"] == null ? null : Ability1Casts.fromJson(json["damageDeltaPerRound"]),
      rank: json["rank"] == null ? null : Rank.fromJson(json["rank"]),
      trnPerformanceScore: json["trnPerformanceScore"] == null ? null : TrnPerformanceScore.fromJson(json["trnPerformanceScore"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "playtime": playtime?.toJson(),
    "roundsPlayed": roundsPlayed?.toJson(),
    "roundsWon": roundsWon?.toJson(),
    "roundsLost": roundsLost?.toJson(),
    "roundsDisconnected": roundsDisconnected?.toJson(),
    "placement": placement?.toJson(),
    "score": score?.toJson(),
    "kills": kills?.toJson(),
    "deaths": deaths?.toJson(),
    "assists": assists?.toJson(),
    "damage": damage?.toJson(),
    "damageReceived": damageReceived?.toJson(),
    "headshots": headshots?.toJson(),
    "grenadeCasts": grenadeCasts?.toJson(),
    "ability1Casts": ability1Casts?.toJson(),
    "ability2Casts": ability2Casts?.toJson(),
    "ultimateCasts": ultimateCasts?.toJson(),
    "dealtHeadshots": dealtHeadshots?.toJson(),
    "dealtBodyshots": dealtBodyshots?.toJson(),
    "dealtLegshots": dealtLegshots?.toJson(),
    "econRating": econRating?.toJson(),
    "suicides": suicides?.toJson(),
    "revived": revived?.toJson(),
    "firstBloods": firstBloods?.toJson(),
    "firstDeaths": firstDeaths?.toJson(),
    "lastDeaths": lastDeaths?.toJson(),
    "survived": survived?.toJson(),
    "traded": traded?.toJson(),
    "kasted": kasted?.toJson(),
    "kAST": kAst?.toJson(),
    "flawless": flawless?.toJson(),
    "thrifty": thrifty?.toJson(),
    "aces": aces?.toJson(),
    "teamAces": teamAces?.toJson(),
    "clutches": clutches?.toJson(),
    "clutchesLost": clutchesLost?.toJson(),
    "plants": plants?.toJson(),
    "defuses": defuses?.toJson(),
    "kdRatio": kdRatio?.toJson(),
    "scorePerRound": scorePerRound?.toJson(),
    "damagePerRound": damagePerRound?.toJson(),
    "headshotsPercentage": headshotsPercentage?.toJson(),
    "damageDelta": damageDelta?.toJson(),
    "damageDeltaPerRound": damageDeltaPerRound?.toJson(),
    "rank": rank?.toJson(),
    "trnPerformanceScore": trnPerformanceScore?.toJson(),
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
  final dynamic percentile;
  final String? displayName;
  final String? displayCategory;
  final String? category;
  final dynamic description;
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

class DataMetadata {
  DataMetadata({
    required this.schema,
    required this.next,
  });

  final String? schema;
  final num? next;

  factory DataMetadata.fromJson(Map<String, dynamic> json){
    return DataMetadata(
      schema: json["schema"],
      next: json["next"],
    );
  }

  Map<String, dynamic> toJson() => {
    "schema": schema,
    "next": next,
  };

}
