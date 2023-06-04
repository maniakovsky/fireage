import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:skyblock/services/headers.dart';
import '../models/top_economy.dart';

class TopEconomyRanking {
  static Future<List<topEconomy>> TopEconomyApi() async {
    const url = 'https://php.fireage.pl:8099/top/balance';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json as List<dynamic>;
    final transformed = results.map((e) {
      return topEconomy(
        username: e['username'],
        value: e['value'],
      );
    }).toList();
    return transformed;
  }
}
