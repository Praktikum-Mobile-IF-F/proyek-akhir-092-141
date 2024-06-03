import 'BaseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  // Req Agent Data
  Future<Map<String, dynamic>> loadCharacters() {
    return BaseNetwork.get("v1/agents?isPlayableCharacter=true");
  }

  // Req Map Data
  Future<Map<String, dynamic>> loadMap() {
    return BaseNetwork.get("v1/maps");
  }

  // Req Weapons Data
  Future<Map<String, dynamic>> loadWeapon() {
    return BaseNetwork.get("v1/weapons");
  }

  // Req Character Detail
  Future<Map<String, dynamic>> loadDetailCharacter(String characterName) {
    return BaseNetwork.get("characters/$characterName");
  }

  Future<Map<String, dynamic>> loadTrackerData(String username, String tag) {
    return BaseNetwork.getTrackerData('$username%23$tag');
  }

  Future<Map<String, dynamic>> loadMatchTrackerData(String username, String tag) {
    return BaseNetwork.getMatchTrackerData('$username%23$tag');
  }
}