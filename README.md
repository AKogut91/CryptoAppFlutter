
#Prompt: Flutter App with MVVM + REST API (Crypto Info)

Create a Flutter app that fetches cryptocurrency market data and derivatives exchange data from the CoinGecko REST API, using MVVM architecture.

## Requirements:
Use MVVM pattern to separate logic.
Create a reusable NetworkService to perform generic API requests.
Define API base URL https://api.coingecko.com/api/v3/ and two endpoints:
coins/markets (with vs_currency=usd and optional params)
derivatives/exchanges

Show results in a ListView with a segmented Picker toggle for:
Coin Markets
Derivatives Exchanges

Each list item should include:
Coin image and price (for market coins)
Exchange name, country, and year (for exchanges)
On API failure, display an Alert with the title: "Request is Failured"
Set the Navigation title to "Crypto Info"

## 🔧 Libraries to Use
http (for REST API calls)
provider (for MVVM state management)
cached_network_image (for loading images)
cupertino_icons (for CupertinoPicker)

- - - - - - - - - - - - - - - - - - - - - 

# lib

models/
   ── coin.dart
   ── exchange.dart
   
services/
   ── network_service.dart
   
 view_models/
   ─ crypto_view_model.dart
   
views/
  ── crypto_info_screen.dart
  
main.dart

# CryptoApp

A new Flutter project created with FlutLab - https://flutlab.io

## Getting Started

A few resources to get you started if this is your first Flutter project:

- https://flutter.dev/docs/get-started/codelab
- https://flutter.dev/docs/cookbook

For help getting started with Flutter, view our
https://flutter.dev/docs, which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Getting Started: FlutLab - Flutter Online IDE

- How to use FlutLab? Please, view our https://flutlab.io/docs
- Join the discussion and conversation on https://flutlab.io/residents


