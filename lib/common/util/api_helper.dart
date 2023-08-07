import 'package:http/http.dart' as http;

import '../constants.dart';

class ApiHelper {
  Future<http.Response> getResponse(String endpoint) async {
    final url = Uri.parse("$urlApi/$endpoint");
    final header = {'Content-Type': 'application/json'};

    try {
      return await http
          .get(url, headers: header)
          .timeout(const Duration(seconds: 10));
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> postResponse(
      String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse("$urlApi/$endpoint");

    try {
      return await http
          .post(url, body: body)
          .timeout(const Duration(seconds: 10));
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> deleteResponse(String endpoint, dynamic id) async {
    final url = Uri.parse("$urlApi/$endpoint/$id");

    try {
      return await http.delete(url).timeout(const Duration(seconds: 10));
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> putResponse(
      String endpoint, Map<String, dynamic> body, dynamic id) async {
    final url = Uri.parse("$urlApi/$endpoint/$id");

    try {
      return await http
          .put(url, body: body)
          .timeout(const Duration(seconds: 10));
    } catch (e) {
      rethrow;
    }
  }
}
