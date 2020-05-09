import 'package:appbrewery/bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';

class BitcoinTicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PriceScreen(),
    );
  }
}
