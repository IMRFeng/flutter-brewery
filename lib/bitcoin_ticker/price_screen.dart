import 'dart:io' show Platform;

import 'package:appbrewery/bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  CoinData coinData = CoinData();
  String coinValueInBTC = '?';
  String coinValueInETH = '?';
  String coinValueInLTC = '?';

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: List<DropdownMenuItem<String>>.generate(
        kCurrenciesList.length,
        (idx) => DropdownMenuItem(
          child: Text(kCurrenciesList[idx]),
          value: kCurrenciesList[idx],
        ),
      ),
      onChanged: (val) {
        setState(() {
          resetDefaultValue();
          selectedCurrency = val;
        });

        getPriceData();
      },
    );
  }

  void resetDefaultValue() {
    setState(() {
      coinValueInBTC = '?';
      coinValueInETH = '?';
      coinValueInLTC = '?';
    });
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIdx) {
        setState(() {
          resetDefaultValue();
          selectedCurrency = kCurrenciesList[selectedIdx];
        });

        getPriceData();
      },
      children: List<Widget>.generate(
        kCurrenciesList.length,
        (idx) => Text(kCurrenciesList[idx]),
      ),
      scrollController: FixedExtentScrollController(
        initialItem: kCurrenciesList.indexOf(selectedCurrency),
      ),
    );
  }

  void getPriceData() async {
    Future.wait([
      coinData.getPriceData(selectedCurrency),
      coinData.getPriceData(selectedCurrency, assetBase: 'ETH'),
      coinData.getPriceData(selectedCurrency, assetBase: 'LTC'),
    ]).then((prices) {
      setState(() {
        coinValueInBTC = double.parse(prices[0].toString()).toStringAsFixed(0);
        coinValueInETH = double.parse(prices[1].toString()).toStringAsFixed(0);
        coinValueInLTC = double.parse(prices[2].toString()).toStringAsFixed(0);
      });
    });
  }

  String getCoinValue(String coinType) {
    return coinType == 'BTC'
        ? coinValueInBTC
        : coinType == 'ETH' ? coinValueInETH : coinValueInLTC;
  }

  @override
  void initState() {
    super.initState();
    getPriceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: List<Widget>.generate(
                kCryptoList.length,
                (idx) => CardListWidget(
                  cryptoType: kCryptoList[idx],
                  coinValue: getCoinValue(kCryptoList[idx]),
                  selectedCurrency: selectedCurrency,
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CardListWidget extends StatelessWidget {
  CardListWidget({
    @required this.cryptoType,
    @required this.coinValue,
    @required this.selectedCurrency,
  });

  final String coinValue;
  final String selectedCurrency;
  final String cryptoType;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoType = $coinValue $selectedCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
