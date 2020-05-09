import 'dart:convert';

import 'package:http/http.dart';

const List<String> kCurrenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> kCryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const kCoinAPIKey = 'A09C877A-6133-4751-BAC4-D35B6F57EAC4';
const kCoinAPIURL = 'https://rest.coinapi.io';

class CoinData {
  Future getPriceData(String assetQuote, {assetBase = 'BTC'}) async {
    Response res = await get(
        '$kCoinAPIURL/v1/exchangerate/$assetBase/$assetQuote?apikey=$kCoinAPIKey');
    if (res.statusCode == 200) {
      return jsonDecode(res.body)['rate'];
    } else {
      print(res.statusCode);
      throw 'Problem with the get request';
    }
  }
}
