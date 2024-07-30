import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:plv/utils/device/device_utility.dart';

class HttpHelper {
  static const String _baseUrl =
      'https://plv-algerie.com/api'; // Replace with your API base URL

  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Future<Map<String, dynamic>> get(String endpoint,
      {bool auth = false}) async {
    final httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    final IOClient ioClient = IOClient(httpClient);
    if (auth) {
      String? token = await TDeviceUtils().getToken();
      headers['Authorization'] = 'Bearer $token';
    }
    final response =
        await ioClient.get(Uri.parse('$_baseUrl/$endpoint'), headers: headers);
    return _handleResponse(response);
  }

  // Helper method to make a POST request
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data,
      {bool auth = false}) async {
    final httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    final IOClient ioClient = IOClient(httpClient);
    if (auth) {
      String? token = await TDeviceUtils().getToken();
      headers['Authorization'] = 'Bearer $token';
    }
    final response = await ioClient.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data,
      {bool auth = false}) async {
    final httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    final IOClient ioClient = IOClient(httpClient);
    if (auth) {
      String? token = await TDeviceUtils().getToken();
      headers['Authorization'] = 'Bearer $token';
    }
    final response = await ioClient.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint,
      {bool auth = false}) async {
    final httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    final IOClient ioClient = IOClient(httpClient);
    if (auth) {
      String? token = await TDeviceUtils().getToken();
      headers['Authorization'] = 'Bearer $token';
    }
    final response = await ioClient.delete(Uri.parse('$_baseUrl/$endpoint'),
        headers: headers);
    return _handleResponse(response);
  }

  // Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
