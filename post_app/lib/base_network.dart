import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static final String baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List<dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;

    debugPrint("BaseNetwork - fullUrl : $fullUrl");

    final response = await http.get(Uri.parse(fullUrl));

    debugPrint("BaseNetwork - response : ${response.body}");

    return _processResponse(response);
  }

  static List<dynamic> _processResponse(http.Response response) {
    final body = response.body;
    final dynamic jsonBody = json.decode(body);

    if (jsonBody is List) {
      return jsonBody;
    } else {
      throw Exception('Unexpected response format');
    }
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}
