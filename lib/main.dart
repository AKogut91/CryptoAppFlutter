import 'package:flutter/material.dart';
import 'ViewModel/crypto_view_model.dart';
import 'View/crypto_info_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CryptoViewModel(),
      child: MaterialApp(
        home: CryptoInfoScreen(),
      ),
    );
  }
}
