// services/network_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cryptoapp/Model/coin.dart';
import 'package:cryptoapp/Model/exchange.dart';

class NetworkService {
  final String baseUrl = 'https://api.coingecko.com/api/v3/';

  Future<List<Coin>> fetchCoins() async {
    final response = await http.get(Uri.parse(
        '${baseUrl}coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((item) => Coin.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load coins');
    }
  }

  Future<List<Exchange>> fetchExchanges() async {
    final response =
        await http.get(Uri.parse('${baseUrl}derivatives/exchanges'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((item) => Exchange.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load exchanges');
    }
  }
}
