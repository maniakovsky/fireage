import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../models/bans.dart';

final headers = <String, String>{
  HttpHeaders.acceptHeader: 'application/json',
  HttpHeaders.contentTypeHeader: 'application/json',
  HttpHeaders.cacheControlHeader: 'no-cache',
  HttpHeaders.pragmaHeader: 'no-cache',
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers':
      'Origin, Content-Type, Accept, Authorization, X-Request-With',
  'Access-Control-Allow-Credentials': 'true',
};

class banAPI {
  static Future<List<bans>> bansAPI() async {
    const url = 'https://php.fireage.pl:8099/bans';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json as List<dynamic>;
    final transformed = results.map((e) {
      return bans(
          avatar: e['name'],
          reason: e['reason'],
          name: e['name'],
          punishmentType: e['punishmentType'],
          operator: e['operator']);
    }).toList();
    return transformed;
  }
}
