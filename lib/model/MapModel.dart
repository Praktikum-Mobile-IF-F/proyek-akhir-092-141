class MapModel {
  final num? status;
  final List<MapData>? data;

  MapModel({
    this.status,
    this.data,
  });

  MapModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as num?,
        data = (json['data'] as List?)?.map((dynamic e) => MapData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class MapData {
  final String? uuid;
  final String? displayName;
  final dynamic narrativeDescription;
  final String? tacticalDescription;
  final String? coordinates;
  final String? displayIcon;
  final String? listViewIcon;
  final String? listViewIconTall;
  final String? splash;
  final String? stylizedBackgroundImage;
  final String? premierBackgroundImage;
  final String? assetPath;
  final String? mapUrl;
  final num? xMultiplier;
  final num? yMultiplier;
  final num? xScalarToAdd;
  final num? yScalarToAdd;
  final List<Callouts>? callouts;

  MapData({
    this.uuid,
    this.displayName,
    this.narrativeDescription,
    this.tacticalDescription,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.listViewIconTall,
    this.splash,
    this.stylizedBackgroundImage,
    this.premierBackgroundImage,
    this.assetPath,
    this.mapUrl,
    this.xMultiplier,
    this.yMultiplier,
    this.xScalarToAdd,
    this.yScalarToAdd,
    this.callouts,
  });

  MapData.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] as String?,
        displayName = json['displayName'] as String?,
        narrativeDescription = json['narrativeDescription'],
        tacticalDescription = json['tacticalDescription'] as String?,
        coordinates = json['coordinates'] as String?,
        displayIcon = json['displayIcon'] as String?,
        listViewIcon = json['listViewIcon'] as String?,
        listViewIconTall = json['listViewIconTall'] as String?,
        splash = json['splash'] as String?,
        stylizedBackgroundImage = json['stylizedBackgroundImage'] as String?,
        premierBackgroundImage = json['premierBackgroundImage'] as String?,
        assetPath = json['assetPath'] as String?,
        mapUrl = json['mapUrl'] as String?,
        xMultiplier = json['xMultiplier'] as num?,
        yMultiplier = json['yMultiplier'] as num?,
        xScalarToAdd = json['xScalarToAdd'] as num?,
        yScalarToAdd = json['yScalarToAdd'] as num?,
        callouts = (json['callouts'] as List?)?.map((dynamic e) => Callouts.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'uuid' : uuid,
    'displayName' : displayName,
    'narrativeDescription' : narrativeDescription,
    'tacticalDescription' : tacticalDescription,
    'coordinates' : coordinates,
    'displayIcon' : displayIcon,
    'listViewIcon' : listViewIcon,
    'listViewIconTall' : listViewIconTall,
    'splash' : splash,
    'stylizedBackgroundImage' : stylizedBackgroundImage,
    'premierBackgroundImage' : premierBackgroundImage,
    'assetPath' : assetPath,
    'mapUrl' : mapUrl,
    'xMultiplier' : xMultiplier,
    'yMultiplier' : yMultiplier,
    'xScalarToAdd' : xScalarToAdd,
    'yScalarToAdd' : yScalarToAdd,
    'callouts' : callouts?.map((e) => e.toJson()).toList()
  };
}

class Callouts {
  final String? regionName;
  final String? superRegionName;
  final Location? location;

  Callouts({
    this.regionName,
    this.superRegionName,
    this.location,
  });

  Callouts.fromJson(Map<String, dynamic> json)
      : regionName = json['regionName'] as String?,
        superRegionName = json['superRegionName'] as String?,
        location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'regionName' : regionName,
    'superRegionName' : superRegionName,
    'location' : location?.toJson()
  };
}

class Location {
  final num? x;
  final num? y;

  Location({
    this.x,
    this.y,
  });

  Location.fromJson(Map<String, dynamic> json)
      : x = json['x'] as num?,
        y = json['y'] as num?;

  Map<String, dynamic> toJson() => {
    'x' : x,
    'y' : y
  };
}