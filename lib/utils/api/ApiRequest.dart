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
}