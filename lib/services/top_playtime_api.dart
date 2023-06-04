import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:skyblock/services/headers.dart';

import '../models/top_playtime.dart';

class TopPlaytimeRanking {
  static Future<List<topPlaytime>> TopPlaytimeApi() async {
    const url = 'https://php.fireage.pl:8099/top/playm';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json as List<dynamic>;
    final transformed = results.map((e) {
      return topPlaytime(
        username: e['username'],
        value: e['value'],
      );
    }).toList();
    return transformed;
  }
}
