import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sistema_libreria_app/core/constant/api_constants.dart';
import 'package:sistema_libreria_app/core/errors/app_exception.dart';
import 'dart:io';
import 'package:sistema_libreria_app/data/repositories/token_repository.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  final TokenRepository _tokenRepository;
  ApiClient(this._tokenRepository);
  final http.Client _client = http.Client();
  Future<dynamic> get(String path, {Map<String, String>? query}) async => _send('GET', path, query, null);
  Future<dynamic> post(String path, {Object? body}) async => _send('POST', path, null, body);
  Future<dynamic> put(String path, {Object? body}) async => _send('PUT', path, null, body);
  Future<dynamic> delete(String path) async => _send('DELETE', path, null, null);

  Future<dynamic> _send(String method, String path, Map<String, String>? query, Object? body) async {
    final baseUrl = ApiConstants.instance.baseUrl;
    final uri = Uri.parse('$baseUrl$path').replace(queryParameters: query);
    final headers = {'Content-Type': 'application/json'};

    final token= await _tokenRepository.getToken();
    if(token != null) {
      headers['Authorization'] = 'Bearer ${token.accessToken}';
    }

    final request = http.Request(method, uri)..headers.addAll(headers);
    if(body != null) {
      request.body = jsonEncode(body);
    }

    final http.Response response;
    try {
      response = await _client.send(request)
      .timeout(ApiConstants.timeoutDuration)
      .then(http.Response.fromStream);
    } on TimeoutException {
      throw const NetworkException('Request timed out. Please try again later.');
    } on SocketException {
      throw const NetworkException('No se pudo conectar con el servidor.');
    }on http.ClientException {
      throw const NetworkException();
    }

    if (response.statusCode == 401) {
      debugPrint('$method $uri -> ${response.statusCode} (token enviado: ${token != null})');
      throw const UnauthorizedException();
    }

    return _decode(response);
  }

  dynamic _decode(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ServerException('Request failed', statusCode: response.statusCode);
    }
    if(response.body.isEmpty) return null;

    try {
      return jsonDecode(response.body);
    } on FormatException {
      throw const ParsingException();
    }

  }

  void dispose() => _client.close();
}