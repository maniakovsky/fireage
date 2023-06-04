import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:skyblock/services/headers.dart';
import '../models/top_islands.dart';

class TopIslandRanking {
  static Future<List<topIslands>> TopIslandsApi() async {
    const url = 'https://php.fireage.pl:8099/top/island';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json as List<dynamic>;
    final transformed = results.map((e) {
      return topIslands(
        username: e['username'],
        value: e['value'],
      );
    }).toList();
    return transformed;
  }
}
