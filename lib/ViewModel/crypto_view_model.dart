import 'package:flutter/material.dart';
import 'package:cryptoapp/Model/coin.dart';
import 'package:cryptoapp/Model/exchange.dart';
import 'package:cryptoapp/NetworkService/network_service.dart';

class CryptoViewModel extends ChangeNotifier {
  final NetworkService _networkService = NetworkService();

  List<Coin> _coins = [];
  List<Exchange> _exchanges = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Coin> get coins => _coins;
  List<Exchange> get exchanges => _exchanges;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchCoins() async {
    _isLoading = true;
    notifyListeners();
    try {
      _coins = await _networkService.fetchCoins();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load coins';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchExchanges() async {
    _isLoading = true;
    notifyListeners();
    try {
      _exchanges = await _networkService.fetchExchanges();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load exchanges';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
