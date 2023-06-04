import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:skyblock/models/eco_ranking.dart';

class RankingAPI {
  static Future<List<ecoRanking>> rankAPI() async {
    const url = 'https://php.fireage.pl:8099/top/balance';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json as List<dynamic>;
    final tranformed = results.map((e) {
      return ecoRanking(
          avatar: e['username'], balance: e['value'], nickname: e['username']);
    }).toList();
    return tranformed;
  }
}
