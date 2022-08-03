import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  var client = http.Client();
  final String url = "https://api.thecatapi.com/v1/breeds";

  static const int _requestSeconds = 10;

  Future<Map<String, String>> getHeaders() async {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
    };
  }

  Future<Map<String, dynamic>> getRequest() async {
    try {
      var response = await client.get(Uri.parse(url), headers: await getHeaders())
          .timeout(const Duration(seconds: _requestSeconds))
          .catchError((e) => throw e.toString());

      final body = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw body;
      }

      return body;
    } catch (err, t) {
      print(err);
      print(t);
      rethrow;
    } finally {
      client.close();
    }
  }

}