import 'BaseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  // Req Agent Data
  Future<Map<String, dynamic>> loadCharacters() {
    return BaseNetwork.get("/v1/agents?isPlayableCharacter=true");
  }

  // Req Character Detail
  Future<Map<String, dynamic>> loadDetailCharacter(String characterName) {
    return BaseNetwork.get("characters/$characterName");
  }
}