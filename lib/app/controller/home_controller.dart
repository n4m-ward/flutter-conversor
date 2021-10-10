import 'package:conversor/app/service/currency_service.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  late List<CurrencyService> currencies;
  late CurrencyService toCurrency;
  late CurrencyService fromCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyService.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    // double valueToConvert = toCurrency.getPropertyValue(toCurrency.name.toLowerCase());
    double convertedValue = 0;
    int fixed = 2;
    if(fromCurrency.name == 'Real') {
      convertedValue = value * toCurrency.real;
    } else if(fromCurrency.name == 'Dolar') {
      convertedValue = value * toCurrency.dolar;
    } else if(fromCurrency.name == 'Euro') {
      convertedValue = value * toCurrency.euro;
    } else if(fromCurrency.name == 'Bitcoin') {
      convertedValue = value * toCurrency.bitcoin;
      fixed = 6;
    }

    fromText.text = convertedValue.toStringAsFixed(fixed);
  }
}