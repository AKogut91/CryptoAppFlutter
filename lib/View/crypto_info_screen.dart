import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:cryptoapp/Model/coin.dart';
import 'package:cryptoapp/Model/exchange.dart';
import 'package:cryptoapp/ViewModel/crypto_view_model.dart';

class CryptoInfoScreen extends StatefulWidget {
  @override
  State<CryptoInfoScreen> createState() => _CryptoInfoScreenState();
}

class _CryptoInfoScreenState extends State<CryptoInfoScreen> {
  String selectedView = 'coins';

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<CryptoViewModel>(context, listen: false);
    viewModel.fetchCoins();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CryptoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Info'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CupertinoSegmentedControl<String>(
              children: {
                'coins': Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Coin Markets'),
                ),
                'exchanges': Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Derivatives Exchanges'),
                ),
              },
              groupValue: selectedView,
              onValueChanged: (value) {
                setState(() {
                  selectedView = value;
                  if (value == 'coins') {
                    viewModel.fetchCoins();
                  } else {
                    viewModel.fetchExchanges();
                  }
                });
              },
            ),
          ),
          if (viewModel.isLoading)
            Expanded(child: Center(child: CircularProgressIndicator()))
          else if (viewModel.errorMessage.isNotEmpty)
            Expanded(
              child: Center(
                child: AlertDialog(
                  title: Text("Request is Failured"),
                  content: Text(viewModel.errorMessage),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("OK"),
                    )
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: selectedView == 'coins'
                    ? viewModel.coins.length
                    : viewModel.exchanges.length,
                itemBuilder: (context, index) {
                  if (selectedView == 'coins') {
                    final Coin coin = viewModel.coins[index];
                    return ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: coin.imageUrl,
                        width: 32,
                        height: 32,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      title: Text(coin.name),
                      subtitle:
                          Text('\$${coin.currentPrice.toStringAsFixed(2)}'),
                    );
                  } else {
                    final Exchange exchange = viewModel.exchanges[index];
                    return ListTile(
                      title: Text(exchange.name),
                      subtitle: Text(
                          '${exchange.country} - Since ${exchange.yearEstablished}'),
                    );
                  }
                },
              ),
            )
        ],
      ),
    );
  }
}
