import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  final _client = http.Client();
  final String _apiUrl = "https://api.thecatapi.com/v1";

  static const int _requestSeconds = 10;

  Future<Map<String, String>> _headers() async {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
    };
  }

  Future<List<dynamic>> getRequest(String url) async {
    try {
      var response = await _client.get(Uri.parse('$_apiUrl/$url'), headers: await _headers())
          .timeout(const Duration(seconds: _requestSeconds))
          .catchError((e) => throw e.toString());

      final List<dynamic>  body = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw body;
      }

      return body;
    } catch (err, t) {
      print(err);
      print(t);
      rethrow;
    } finally {
      _client.close();
    }
  }

}