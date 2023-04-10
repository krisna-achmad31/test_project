import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'network_exception.dart';

class ApiCaller {

  final String _baseUrl = 'https://recruitment.pt-bks.com/test';

  // final UserRepository _userProvider = UserRepository();

  String getBaseUrl() {
    return _baseUrl;
  }

  Future<dynamic> get(String url, Map<String, dynamic>? param) async {
    var responseJson;
    try {
      String queryString = Uri(queryParameters: param).query;
      final uri = Uri.parse("$_baseUrl/$url?$queryString");
      print(uri);
      final response = await http.get(uri);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // Future<dynamic> get(String url, Map param) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(param);
  //     String queryString = Uri(queryParameters: param).query;
  //     final uri = Uri.parse("$_baseUrl/$url?$queryString");
  //     final response = await http.get(uri);
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> post(String url, Object body) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(body);
  //     final uri = Uri.parse("$_baseUrl/$url");
  //     final response = await http.post(uri, body: body);
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> authorizedGet(String url, Map param) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(param);
  //     String token = await _userProvider.getToken();
  //     print(token);
  //     String queryString = "";
  //     if (param.isNotEmpty) {
  //       queryString = Uri(queryParameters: param).query;
  //     }
  //     final uri = Uri.parse("$_baseUrl/$url?$queryString");
  //     final response = await http.get(uri, headers: {HttpHeaders.authorizationHeader: token});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> authorizedPost(String url, Object body) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(body);
  //     String token = await _userProvider.getToken();
  //     final uri = Uri.parse("$_baseUrl/$url");
  //     final response = await http.post(uri, body: body, headers: {HttpHeaders.authorizationHeader: token});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> authorizedPatch(String url, Object body) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(body);
  //     String token = await _userProvider.getToken();
  //     final uri = Uri.parse("$_baseUrl/$url");
  //     final response = await http.patch(uri, body: body, headers: {HttpHeaders.authorizationHeader: token});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> authorizedDelete(String url, Object body) async {
  //   var responseJson;
  //   try {
  //     print("$_baseUrl/$url");
  //     print(body);
  //     String token = await _userProvider.getToken();
  //     final uri = Uri.parse("$_baseUrl/$url");
  //     final response = await http.delete(uri, body: body, headers: {HttpHeaders.authorizationHeader: token});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  dynamic _response(http.Response response) {
    print(response.body.toString());
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
