import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:f290_acf_dindin/model/currency.dart';
import 'package:http/http.dart';

class CurrencyService {
  final currenciesId = [
    'USD',
    'EUR',
    'GBP',
    'ARS',
    'CAD',
    'AUD',
    'JPY',
    'CNY',
    'BTC'
  ];

  getData() async {
    Response response =
        await get(Uri.parse('https://api.hgbrasil.com/finance'));

    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    } else {
      log('Fail: Code: ${response.statusCode}: ${response.body}');
      throw Exception('Fail: Code: ${response.statusCode}: ${response.body}');
    }
  }

  Future<List<Currency>> getCurrencies() async {
    var data = await getData();
    var json = jsonDecode(data!);
    var currencyMap = json['results']['currencies'];

    return currenciesId.map((id) => Currency.fromMap(currencyMap[id])).toList();
  }

  //TODO: Criar model class Stock para gerenciar as cotacoes de acoes
  //TODO: Criar metodo para obter Stocks

}
