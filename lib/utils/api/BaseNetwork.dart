import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static final String baseUrl = "https://valorant-api.com";

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;

    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }

  static Future<Map<String, dynamic>> post(
      String partUrl, Map<String, dynamic> data) async {
    final String fullUrl = baseUrl + "/" + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.post(Uri.parse(fullUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }

  // For Array / List
  // static Future<List<dynamic>> getList(String partUrl) async {
  //   final String fullUrl = baseUrl + "/" + partUrl;
  //   debugPrint("BaseNetwork - fullUrl : $fullUrl");
  //   final response = await http.get(Uri.parse(fullUrl));
  //   debugPrint("BaseNetwork - response : ${response.body}");
  //   return _processResponseList(response);
  // }

  // static Future<List<dynamic>> _processResponseList(
  //     http.Response response) async {
  //   final body = response.body;
  //
  //   if (body.isNotEmpty) {
  //     final jsonBody = json.decode(body);
  //     return jsonBody;
  //   } else {
  //     print("processResponse error");
  //     return ['error'];
  //   }
  // }
//End of for Array
}